class Cipher
  attr_reader :characters,
              :date

  def initialize
    @characters = ("a".."z").to_a << " "
    @date = Date.today
  end

  def random_key

  end
end
