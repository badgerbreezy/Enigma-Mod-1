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
  end

  def date_shift(date)
    ((date.to_i ** 2) % 10000).to_s
  end

  def encrypt(encryption, key, date)


    encryption_hash = {encryption: encryption, key: key, date: date}
  end

  def encrypt1(encryption, key, date)
    encryption_hash = Hash.new

  end
end
