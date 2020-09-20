class Enigma
  def initialize
  end

  def characters
    characters = ("a".."z").to_a << " "
  end

  def encrypt(encryption, key, date)
    encryption_hash = Hash.new

    shift1 = rand(9 ** 5).to_s.rjust(5, '0')
    shift2 = date.to_i ** 2
  end
end
