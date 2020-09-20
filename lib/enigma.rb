class Enigma
  def initialize
  end

  def characters
    characters = ("a".."z").to_a << " "
  end

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
    date_shifted = ((date.to_i ** 2) % 10000).to_s.split("")
    date_shifted.map do |number|
      number.to_i
    end
  end

  def total_shift(key, date)
    key_date = []
    key_date << key_shift(key)
    key_date << date_shift(date)
    key_date.transpose.map do |sub_array|
      sub_array.sum
    end
  end

  def encrypt(encryption, key, date)
    encryption_array = encryption.split("")
    encryption_letters = encryption_array.map do |letter|
      letter.ord
    end

    encryption_fours = encryption_letters.each_slice(4).to_a
    encryption_fours 
    require 'Pry';binding.pry
    #   sub_array.map do |letter|
    #     letter.ord
    #   end
    # end
    # encryption_fours
# require 'Pry';binding.pry

    key_shift = sum.each_cons(2).map do |sub_array| #["0, 2"] ["2"]
      sub_array.join
    end

    encryption_hash = {encryption: encrypted, key: key, date: date}
  end

  def encrypt1(encryption, key, date)
    encryption_hash = Hash.new

  end
end
