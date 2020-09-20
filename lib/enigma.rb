class Enigma
  def initialize
  end

  def characters
    characters = ("a".."z").to_a << " "
  end

  def generate_key
    rand(9 ** 5).to_s.rjust(5, '0')
  end

  def encrypt(encryption, key, date)
    key_array = []
    key_array << key.split("")
    key_array.each_cons(2) do |number|
      number
    end

    # encryption_letters = encryption.map do |letter|
    #   p letter
    # end
    encryption_hash = {encryption: encryption, key: key, date: date}
  end

  def encrypt1(encryption, key, date)
    encryption_hash = Hash.new

    shift1 = rand(9 ** 5).to_s.rjust(5, '0')
    shift2 = date.to_i ** 2
  end
end
