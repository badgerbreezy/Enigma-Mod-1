class Decrypt
  attr_reader :characters, :date

  def initialize(key)
    @characters = Enigma.new.characters
    @total_shift = Enigma.new.total_shift(key)
    @date = Enigma.new.date
  end


  def decryption_shift
    @total_shift.map do |shift|
      -shift
    end
  end

  def a_rotation(letter, key)
    a_rotation = @characters.rotate(decryption_shift[0])
    Hash[characters.zip(a_rotation)][letter]
  end


  def b_rotation(letter, key)
    b_rotation = @characters.rotate(decryption_shift[1])
    Hash[characters.zip(b_rotation)][letter]
  end


  def c_rotation(letter, key)
    c_rotation = @characters.rotate(decryption_shift[2])
    Hash[characters.zip(c_rotation)][letter]
  end


  def d_rotation(letter, key)
    d_rotation = @characters.rotate(decryption_shift[3])
    Hash[characters.zip(d_rotation)][letter]
  end

  def decrypt(message, key)
    message_array = message.downcase.split("").each_slice(4).to_a
    decrypted_array = []
    message_array.each do |sub_array|
      decrypted_array << a_rotation(sub_array[0], key)
      decrypted_array << b_rotation(sub_array[1], key)
      decrypted_array << c_rotation(sub_array[2], key)
      decrypted_array << d_rotation(sub_array[3], key)
    end
    decrypted = decrypted_array.join
    decryption_hash = {decryption: decrypted, key: key}
  end
end
