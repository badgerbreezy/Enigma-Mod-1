class Enigma
  attr_reader :date, :encrypt, :decrypt, :key, :message
  def initialize
    @message = message
    @key = key
    @encrypt = Encrypt.new(key)
    @decrypt = Decrypt.new(key)
  end

  def encrypt(message, key)
    @encrypt.encrypt(message, key)
  end

  def decrypt(message, key)
    @decrypt.decrypt(message, key)
  end
end
