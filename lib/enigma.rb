class Enigma
  # attr_reader :characters
  # def initialize
  #   @characters = characters
  # end

  def characters
    characters = ("a".."z").to_a << " "
  end

  # def characters_as_hash
  #   Hash[characters.zip(1..27)]
  # end

  def generate_key
    rand(9 ** 5).to_s.rjust(5, '0')
  end

  def key_shift(key)
    key_array = key.split("")
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

  def date_shift(date)
    date_shifted = (date.to_i ** 2).to_s
    last_four_digits = date_shifted[-4..-1].split("")
    last_four_digits.map do |number|
      number.to_i
    end
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
