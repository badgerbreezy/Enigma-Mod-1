class Enigma
  def initialize
  end

  def characters
    characters = ("a".."z").to_a << " "
  end

  def characters_as_hash
    Hash[characters.zip(1..27)]
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
    date_shifted = (date.to_i ** 2).to_s
    last_four_digits = date_shifted[-4..-1]
    # last_four_digits.map do |number|
    #   number.to_i
    # end
  end

  def a_rotation
    generate_key[0..1]
  end

  def b_rotation
    generate_key[1..2]
  end

  def c_rotation
    generate_key[2..3]
  end

  def d_rotation
    generate_key[3..4]
  end

  def a_offset(date)
    date_shift(date)[0]
  end



  # def total_shift(key, date)
  #   key_date = []
  #   key_date << key_shift(key)
  #   key_date << date_shift(date)
  #   key_date.transpose.map do |sub_array|
  #     sub_array.sum
  #   end
  # end

  def encrypt(message, key, date)
    message_array = message.downcase.split("")
    message_ordinals_array = message_array.map do |letter|
      letter.ord
    end.each_slice(4).to_a




    ordinals_array_shift = []
    # encryption_fours = encryption_numbers.each_slice(4).to_a
    message_ordinals_array.each do |sub_array|
      ordinals_array_shift << sub_array
      ordinals_array_shift << total_shift(key, date)
    end
    message_ordinals_sliced = ordinals_array_shift.each_slice(2).to_a
    require 'Pry';binding.pry
    # message_ordinals_shifted = message_ordinals_sliced.map do |sub_array|
    #   sub_array[0].zip(sub_array[1])
    # end
    #
    # shift = message_ordinals_shifted.map do |sub_array|
    #   require 'Pry';binding.pry
    #   sub_array.map do |sub_sub_array|
    #     sub_sub_array.sum
    #   end
    # end
    #
    # letters = shift.map do |sub_array|
    #   sub_array.map do |number|
    #     number.chr
    #   end
    # end




    # encryption_shifted = Array.new(message_ordinals_sliced.map(&:length).max) do |i|
    #   message_ordinals_sliced.map do |e|
    #     e[i]
    #   end
    # end

    #

    # message_ordinals_array.each do |sub_array|
    #   sub_array
    # letter_range = message_ordinals_array.length
    # letter.


    # encryption_hash = {encryption: encrypted, key: key, date: date}
  end

  def encrypt1(encryption, key, date)
    encryption_hash = Hash.new

  end
end
