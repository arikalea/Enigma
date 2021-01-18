require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'
require './lib/cipher'
require 'date'

class CipherTest < Minitest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_characters
    assert_equal 27, @cipher.characters.count
    assert_equal true, @cipher.characters.include?(" ")
  end

  def test_date
    assert_instance_of Date, @cipher.date
  end

  def test_format_date
    assert_equal "180121", @cipher.format_date
  end

  def test_randomly_generated_number
    assert_equal 5, @cipher.random_number.length

    @cipher.stubs(:random_number).returns("12345")
    assert_equal "12345", @cipher.random_number

    @cipher.stubs(:random_number).returns("01234")
    assert_equal "01234", @cipher.random_number
  end

  def test_key_hash_generator
    # skip
    expected = { :a => 12,
                 :b => 23,
                 :c => 34,
                 :d => 45}

    assert_equal expected, @cipher.key_hash_generator("12345")
  end

  def test_offset_hash_generator
    # skip
    expected = { :a => 4,
                 :b => 6,
                 :c => 4,
                 :d => 1}

    assert_equal expected, @cipher.offset_hash_generator(170121)
  end

  def test_shift_hash_generator
    expected = { :a => 16,
                 :b => 29,
                 :c => 38,
                 :d => 46}

    assert_equal expected, @cipher.shift_hash_generator("12345", 170121)
  end

  def test_encrypt_message
    rotated_characters = @cipher.make_shifts(16, 29, 38, 46)
    assert_equal "xgwdd", @cipher.encrpyt("hello", rotated_characters)
  end

  def test_it_can_identify_character_index
    rotated_characters = @cipher.make_shifts(16, 29, 38, 46)
    assert_equal "x", @cipher.identify_index("h", rotated_characters, 1)
    assert_equal "g", @cipher.identify_index("e", rotated_characters, 2)
    assert_equal "w", @cipher.identify_index("l", rotated_characters, 3)
    assert_equal "d", @cipher.identify_index("l", rotated_characters, 4)
  end

  def test_it_shifted_all_characters
    characters = ("a".."z").to_a << " "
    rotated_characters = @cipher.characters_shift(16)

    assert_equal characters, rotated_characters.keys
    assert_equal characters.rotate(16), rotated_characters.values
  end
end
