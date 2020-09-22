module Rotatable
  def a_rotation(letter)
    a_rotation = @characters.rotate(shift[0])
    Hash[characters.zip(a_rotation)][letter]
  end

  def b_rotation(letter)
    b_rotation = @characters.rotate(shift[1])
    Hash[characters.zip(b_rotation)][letter]
  end

  def c_rotation(letter)
    c_rotation = @characters.rotate(shift[2])
    Hash[characters.zip(c_rotation)][letter]
  end

  def d_rotation(letter)
    d_rotation = @characters.rotate(shift[3])
    Hash[characters.zip(d_rotation)][letter]
  end

  def enigma_rotation(message)
    message_array = message.downcase.split("").each_slice(4).to_a
    rotation_array = []
    message_array.each do |sub_array|
      rotation_array << a_rotation(sub_array[0])
      rotation_array << b_rotation(sub_array[1])
      rotation_array << c_rotation(sub_array[2])
      rotation_array << d_rotation(sub_array[3])
    end
    rotation_array.join
  end
end
