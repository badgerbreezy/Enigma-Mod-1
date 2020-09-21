class Decrypt
  attr_reader :characters

  def initialize(key, date)
    @characters = Enigma.new.characters
    @total_shift = Enigma.new.total_shift(key, date)
  end


  def decryption_shift
    @total_shift
  end

  def a_rotation(letter, key, date)
    a_rotation = @characters.rotate(decryption_shift[0])
    Hash[characters.zip(a_rotation)][letter]
  end


  def b_rotation(letter, key, date)
    b_rotation = @characters.rotate(decryption_shift[1])
    Hash[characters.zip(b_rotation)][letter]
  end


  def c_rotation(letter, key, date)
    c_rotation = @characters.rotate(decryption_shift[2])
    Hash[characters.zip(c_rotation)][letter]
  end


  def d_rotation(letter, key, date)
    d_rotation = @characters.rotate(decryption_shift[3])
    Hash[characters.zip(d_rotation)][letter]
  end

  def decrypt(message, key, date)
    message_array = message.downcase.split("").each_slice(4).to_a
    decrypted_array = []
    message_array.each do |sub_array|
      decrypted_array << a_rotation(sub_array[0], key, date)
      decrypted_array << b_rotation(sub_array[1], key, date)
      decrypted_array << c_rotation(sub_array[2], key, date)
      decrypted_array << d_rotation(sub_array[3], key, date)
    end
    decrypted = decrypted_array.join
    decryption_hash = {decryption: decrypted, key: key, date: date}
  end
end
