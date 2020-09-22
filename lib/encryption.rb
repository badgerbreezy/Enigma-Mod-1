require './lib/shiftables'
require './lib/rotatables'

class Encryption
  include Shiftable
  include Rotatable
  attr_reader :characters, :date, :key

  def initialize
    @key = generate_key
    @date = Date.today.strftime("%d%m%y")
    @characters = ("a".."z").to_a << " "
  end

  def generate_key
    rand(9 ** 5).to_s.rjust(5, '0')
  end

  def shift
    total_shift
  end

  def encrypt(message)
    {encryption: enigma_rotation(message), key: key, date: date}
  end
end
