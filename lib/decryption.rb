require './lib/shiftables'
require './lib/rotatables'

class Decryption
  include Shiftable
  include Rotatable
  attr_reader :characters, :date, :key

  def initialize
    @key = ARGV[2]
    @date = ARGV[3]
    @characters = ("a".."z").to_a << " "
  end

  def shift
    total_shift.map do |shift|
      -shift
    end
  end

  def decrypt(message)
    {decryption: enigma_rotation(message), key: key, date: date}
  end
end
