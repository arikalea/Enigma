class Cipher
  attr_reader :characters,
              :date

  def initialize
    @characters = ("a".."z").to_a << " "
    @date = Date.today
  end

  def random_number
    number = rand(99999).to_s
    number.rjust 5,"0"
  end

  # def random_number_array(number = random_number)
  #   random_number.split(//).to_a
  # end

#add in array to this method
  def key_hash_generator(key)
    {a_shift: key.slice(0..1).to_i,
    b_shift: key.slice(1..2).to_i,
    c_shift: key.slice(2..3).to_i,
    d_shift: key.slice(3..4).to_i}
  end
end
