require './lib/encryption'
require './lib/decryption'

class Enigma
  attr_reader :encrypt, :decrypt, :message
  def initialize
    @message = message
    @encryption = Encryption.new
    @decryption = Decryption.new
  end

  def encrypt(message)
    @encryption.encrypt(message)
  end

  def decrypt(message)
    @decryption.decrypt(message)
  end


end

# encrypt = .new
# message = file_io.message
# encryptor = Encrypt.new
#     # ('12345', 280715)
# encryptor.get_rotations
# file_io.output(encryptor.encrypt(message))
# puts encryptor.print_message
