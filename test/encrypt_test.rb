require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/encrypt'
require './lib/enigma'

class EncryptTest < Minitest::Test
  def test_it_exists
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt = Encrypt.new("02715")

    assert_instance_of Encrypt, encrypt
  end

  def test_encryption_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    encrypt = Encrypt.new("02715")

    assert_equal [3, 27, 73, 20], encrypt.encryption_shift
  end

  def test_rotate_letter
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    encrypt = Encrypt.new("02715")
    assert_equal "k", encrypt.a_rotation("h", "02715")
    assert_equal "e", encrypt.b_rotation("e", "02715")
    assert_equal "d", encrypt.c_rotation("l", "02715")
    assert_equal "e", encrypt.d_rotation("l", "02715")
  end

  def test_it_can_encrypt
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    encrypt = Encrypt.new("02715")
    assert_equal ({
        encryption: "keder ohulw",
        key: "02715"
      }), encrypt.encrypt("hello world", "02715")
  end
end
