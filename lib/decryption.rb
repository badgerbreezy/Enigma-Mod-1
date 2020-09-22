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

    message_array = message.downcase.split("").each_slice(4).to_a
    decrypted_array = []
    message_array.each do |sub_array|
      decrypted_array << a_rotation(sub_array[0])
      decrypted_array << b_rotation(sub_array[1])
      decrypted_array << c_rotation(sub_array[2])
      decrypted_array << d_rotation(sub_array[3])
    end
    decrypted = decrypted_array.join
    {decryption: enigma_rotation(message), key: key, date: date}
  end
end
