class Enigma
  attr_reader :encrypt, :decrypt, :message
  def initialize
    @message = message
    @encrypt = Encrypt.new
    @decrypt = Decrypt.new
  end

  def encrypt(message)
    @encrypt.encrypt(message)
  end

  def decrypt(message)
    @decrypt.decrypt(message)
  end
end
