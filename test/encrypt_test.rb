require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/encrypt'
require './lib/enigma'

class EncryptTest < Minitest::Test
  def test_it_exists
    encrypt = Encrypt.new("02715", "040895")

    assert_instance_of Encrypt, encrypt
  end

  def test_total_shift
    enigma = Enigma.new
    encrypt = Encrypt.new("02715", "040895")

    assert_equal [3, 27, 73, 20], encrypt.total_shift("02715", "040895")
  end

  def test_rotate_letter
    enigma = Enigma.new
    encrypt = Encrypt.new("02715", "040895")
    assert_equal "k", encrypt.a_rotation("h", "02715", "040895")
    assert_equal "e", encrypt.b_rotation("e", "02715", "040895")
    assert_equal "d", encrypt.c_rotation("l", "02715", "040895")
    assert_equal "e", encrypt.d_rotation("l", "02715", "040895")
  end

  def test_it_can_encrypt
    enigma = Enigma.new
    encrypt = Encrypt.new("02715", "040895")
    assert_equal ({
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }), encrypt.encrypt("hello world", "02715", "040895")
  end
end
