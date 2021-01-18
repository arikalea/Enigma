require './lib/cipher'

class Enigma
  # attr_reader :cipher

  def initialize
    @cipher = Cipher.new
  end

  def encrypt(message, key = @cipher.random_number, date = @cipher.format_date)
    shift_hash = @cipher.shift_hash_generator(key, date)
    characters = @cipher.make_shifts(shift_hash[:a], shift_hash[:b], shift_hash[:c], shift_hash[:d])
    encrypted_message = @cipher.encrypt(message, characters)
    encryption = { encryption: encrypted_message,
                   key: key,
                   date: date}
  end

  def decrypt(message, key, date = @cipher.format_date)
    shift_hash = @cipher.shift_hash_generator(key, date)
    characters = @cipher.make_shifts(-(shift_hash[:a]), -(shift_hash[:b]), -(shift_hash[:c]), -(shift_hash[:d]))
    encrypted_message = @cipher.encrypt(message, characters)
    decryption = { decryption: encrypted_message,
                   key: key,
                   date: date}
  end
end
