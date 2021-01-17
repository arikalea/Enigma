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

  # def random_number_array(number = random_number)
  #   random_number.split(//).to_a
  # end

  def key_hash_generator(key = random_number)
    {a_shift: key.slice(0..1).to_i,
    b_shift: key.slice(1..2).to_i,
    c_shift: key.slice(2..3).to_i,
    d_shift: key.slice(3..4).to_i}
  end

  def offset_hash_generator(date)
    # hash_date = date.format_date
    squared = (date.to_i ** 2).to_s

    {a_shift: squared.slice(-4).to_i,
    b_shift: squared.slice(-3).to_i,
    c_shift: squared.slice(-2).to_i,
    d_shift: squared.slice(-1).to_i}
  end
end
