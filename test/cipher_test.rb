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
    assert_equal "170121", @cipher.format_date
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
    key = "12345"
    offset = 170121
    expected = { :a => 16,
                 :b => 29,
                 :c => 38,
                 :d => 46}

    assert_equal expected, @cipher.shift_hash_generator(key, offset)
  end

  def test_encrypt_message
    key = "12345"
    offset = 170121

    assert_equal "xgwdd", @cipher.encrypt("hello", key, offset)
  end
end
