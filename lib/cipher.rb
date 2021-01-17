class Cipher
  attr_reader :characters,
              :date

  def initialize
    @characters = ("a".."z").to_a << " "
    @date = Date.today
  end

  def random_key
    key = rand(99999).to_s
    key.rjust 5,"0"
  end

  def random_key_array(random_key)
    random_key.split(//).to_a
  end

  def shift_key(random_key)
    a_key = random_key.split(0..1).to_a
    b_key = random_key.split(1..2).to_a
    c_key = random_key.split(2..3).to_a
    d_key = random_key.split(3..4).to_a
  end
end
