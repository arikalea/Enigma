require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'
require './lib/cipher'
require 'date'

class EnigmaTest < Minitest::Test

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
    assert_equal "170121", @cipher.format_date(Date.today)
  end

  def test_randomly_generated_number
    assert_equal 5, @cipher.random_number.length

    @cipher.stubs(:random_number).returns("12345")
    assert_equal "12345", @cipher.random_number

    @cipher.stubs(:random_number).returns("01234")
    assert_equal "01234", @cipher.random_number
  end

  # def test_random_number_into_array
  #   @cipher.stubs(:random_number).returns("12345")
  #   assert_equal ["1", "2", "3", "4", "5"], @cipher.random_number_array("12345")
  # end

  def test_number_shifting
    # skip
    expected = { :a_shift => 12,
                 :b_shift => 23,
                 :c_shift => 34,
                 :d_shift => 45}

    assert_equal expected, @cipher.key_hash_generator("12345")
  end
end
