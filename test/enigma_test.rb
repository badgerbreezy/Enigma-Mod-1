require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/enigma'
require './lib/encryption'
require './lib/decryption'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_and_decrypt
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    encryption = Encryption.new
    decryption = Decryption.new
    enigma.encryption.stubs(:key).returns('02715')

    assert_equal ({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }), enigma.encrypt("hello world")

    encrypted = enigma.encrypt("hello world")

    enigma.decryption.stubs(:key).returns('02715')
    enigma.decryption.stubs(:date).returns('040895')

    assert_equal ({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      }), enigma.decrypt(encrypted[:encryption])
  end
end
