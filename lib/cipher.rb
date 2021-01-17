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

  def shift_key(key)

  end
end
