class Enigma
  attr_reader :date
  def initialize
    @date = Date.today.strftime("%d%m%y")
  end

  # def date
  #   @date = date
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

  def date_shift
    date_shifted = (@date.to_i ** 2).to_s
    last_four_digits = date_shifted[-4..-1].split("")
    last_four_digits.map do |number|
      number.to_i
    end
  end

  def total_shift(key)
    key_date = []
    key_date << key_shift(key)
    key_date << date_shift
    key_date.transpose.map do |sub_array|
      sub_array.sum
    end
  end


end
