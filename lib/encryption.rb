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
    message_array = message.downcase.split("").each_slice(4).to_a
    encrypted_array = []
    message_array.each do |sub_array|
      encrypted_array << a_rotation(sub_array[0])
      encrypted_array << b_rotation(sub_array[1])
      encrypted_array << c_rotation(sub_array[2])
      encrypted_array << d_rotation(sub_array[3])
    end
    encrypted = encrypted_array.join
    {encryption: encrypted, key: key, date: date}
  end
end
