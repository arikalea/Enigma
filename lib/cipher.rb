require 'date'

class Cipher
  attr_reader :characters,
              :date

  def initialize
    @characters = ("a".."z").to_a << " "
    @date = Date.today
  end

  def format_date
      @date.strftime("%d%m%y")
  end

  def random_number
    number = rand(99999).to_s
    number.rjust 5,"0"
  end

  def key_hash_generator(key)
    {a: key.slice(0..1).to_i,
     b: key.slice(1..2).to_i,
     c: key.slice(2..3).to_i,
     d: key.slice(3..4).to_i}
  end

  def offset_hash_generator(date)
    squared = (date.to_i ** 2).to_s

    {a: squared.slice(-4).to_i,
     b: squared.slice(-3).to_i,
     c: squared.slice(-2).to_i,
     d: squared.slice(-1).to_i}
  end

  def shift_hash_generator(key, date)
    {a: key_hash_generator(key)[:a] + offset_hash_generator(date)[:a],
     b: key_hash_generator(key)[:b] + offset_hash_generator(date)[:b],
     c: key_hash_generator(key)[:c] + offset_hash_generator(date)[:c],
     d: key_hash_generator(key)[:d] + offset_hash_generator(date)[:d]}
  end

  def encrypt(message, key, date)
    letters_to_encrypt = message.downcase.split('')
    require "pry";binding.pry
    # key_hash_generator(key)
    # offset_hash_generator(date)
    #
    # encrypted_letters = letters_to_encrypt.map.with_index do |char, index|
    #   if @characters.include?(char)
    #     @characters.rotate(@characters.index(char))
    #   end
    #   if @characters.include?(char) && i[0]
    #     message_to_encrypt[0].rotate(shift_hash_generator(key, date)[:a])
    #   elsif @characters.include?(char) && i[1]
    #     message_to_encrypt[1].rotate(shift_hash_generator(key, date)[:b])
    #   elsif @characters.include?(char) && i[2]
    #     message_to_encrypt[2].rotate(shift_hash_generator(key, date)[:c])
    #   elsif @characters.include?(char) && i[3]
    #     message_to_encrypt[3].rotate(shift_hash_generator(key, date)[:d])
    #   else
    #     char
    #   end



  end

end
