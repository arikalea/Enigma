require './lib/cipher'

class Enigma

  def initialize
    @cipher = Cipher.new
  end

  def encrypt(message, key = @cipher.random_number, date = @cipher.format_date)
    characters = @cipher.encrypt(key, date)
    encrypted_message = @cipher.shift(message, characters)
    { encryption: encrypted_message,
             key: key,
            date: date}
  end

  def decrypt(message, key, date = @cipher.format_date)
    characters = @cipher.decrypt(key, date)
    encrypted_message = @cipher.shift(message, characters)
    { decryption: encrypted_message,
             key: key,
            date: date}
  end
end
