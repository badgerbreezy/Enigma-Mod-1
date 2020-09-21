class Encrypt
  attr_reader :characters, :date

  def initialize(key)
    @characters = Enigma.new.characters
    @total_shift = Enigma.new.total_shift(key)
    @date = Enigma.new.date
  end


  def encryption_shift
    @total_shift
  end

  def a_rotation(letter, key)
    a_rotation = @characters.rotate(encryption_shift[0])
    Hash[characters.zip(a_rotation)][letter]
  end


  def b_rotation(letter, key)
    b_rotation = @characters.rotate(encryption_shift[1])
    Hash[characters.zip(b_rotation)][letter]
  end


  def c_rotation(letter, key)
    c_rotation = @characters.rotate(encryption_shift[2])
    Hash[characters.zip(c_rotation)][letter]
  end


  def d_rotation(letter, key)
    d_rotation = @characters.rotate(encryption_shift[3])
    Hash[characters.zip(d_rotation)][letter]
  end

  def encrypt(message, key)
    message_array = message.downcase.split("").each_slice(4).to_a
    encrypted_array = []
    message_array.each do |sub_array|
      encrypted_array << a_rotation(sub_array[0], key)
      encrypted_array << b_rotation(sub_array[1], key)
      encrypted_array << c_rotation(sub_array[2], key)
      encrypted_array << d_rotation(sub_array[3], key)
    end
    encrypted = encrypted_array.join
    encryption_hash = {encryption: encrypted, key: key}
  end
end
