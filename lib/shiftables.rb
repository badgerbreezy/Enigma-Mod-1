module Shiftable
  def key_shift
    key_array = key.split("")
    sum = key_array.map do |number|
      number.to_i
    end
    key_shift = sum.each_cons(2).map do |sub_array|
      sub_array.join
    end
    key_shift.map do |number|
      number.to_i
    end
  end

  def date_shift
    date_shifted = (date.to_i ** 2).to_s
    last_four_digits = date_shifted[-4..-1].split("")
    last_four_digits.map do |number|
      number.to_i
    end
  end

  def total_shift
    key_date = [key_shift, date_shift]
    key_date.transpose.map do |sub_array|
      sub_array.sum
    end
  end
end
