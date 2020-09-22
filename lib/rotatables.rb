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
end
