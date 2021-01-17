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

  def test_randomly_generated_key
    assert_equal 5, @cipher.random_key.length
    
    @cipher.stubs(:random_key).returns("12345")
    assert_equal "12345", @cipher.random_key
  end
end
