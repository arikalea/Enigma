require './test/test_helper'
require './lib/enigma'
require './lib/cipher'
require 'date'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_cipher_information
    assert_instance_of Cipher, @cipher
  end

  def test_it_can_encrypt
    expected = {encryption: 'xgwddbgggno',
                key: '12345',
                date: '180121'}

    assert_equal expected, @enigma.encrypt('hello world', '12345', '180121')
    assert_equal expected, @enigma.encrypt('hello world', '12345')
  end

  def test_encrypt_with_uppercase_and_special_characters
    expected = {encryption: 'xgwddbgggno!',
                key: '12345',
                date: '180121'}

    assert_equal expected, @enigma.encrypt('Hello World!', '12345', '180121')
  end

  def test_it_can_decrypt
    expected = {encryption: 'hello world',
                key: '12345',
                date: '180121'}

    assert_equal expected, @enigma.decrypt('xgwddbgggno','12345', '180121')
  end
end
