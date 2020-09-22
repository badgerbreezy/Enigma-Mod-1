class Encryption
  attr_reader :characters, :date, :key

  def initialize
    @key = generate_key
    @date = Date.today.strftime("%d%m%y")
    @characters = CharactersList.new.characters
  end

  def generate_key
    rand(9 ** 5).to_s.rjust(5, '0')
  end

  def key_shift
    key_array = key.split("")
    # require 'Pry';binding.pry
    sum = key_array.map do |number|
      number.to_i
    end
    key_shift = sum.each_cons(2).map do |sub_array| #["0, 2"] ["2"]
      sub_array.join
    end
    key_shift.map do |number|
      number.to_i
    end
  end

  def date_shift
    date_shifted = (@date.to_i ** 2).to_s
    last_four_digits = date_shifted[-4..-1].split("")
    last_four_digits.map do |number|
      number.to_i
    end
  end

  def total_shift
    key_date = []
    key_date << key_shift
    key_date << date_shift
    key_date.transpose.map do |sub_array|
      sub_array.sum
    end
  end

  def a_rotation(letter)
    a_rotation = @characters.rotate(total_shift[0])
    Hash[characters.zip(a_rotation)][letter]
  end


  def b_rotation(letter)
    b_rotation = @characters.rotate(total_shift[1])
    Hash[characters.zip(b_rotation)][letter]
  end


  def c_rotation(letter)
    c_rotation = @characters.rotate(total_shift[2])
    Hash[characters.zip(c_rotation)][letter]
  end


  def d_rotation(letter)
    d_rotation = @characters.rotate(total_shift[3])
    Hash[characters.zip(d_rotation)][letter]
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
    encryption_hash = {encryption: encrypted, key: key, date: date}
  end
end
