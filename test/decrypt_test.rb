require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/decrypt'
require './lib/enigma'

class DecryptTest < Minitest::Test
  def test_it_exists
    decrypt = Decrypt.new("02715", "040895")

    assert_instance_of Decrypt, decrypt
  end

  def test_decryption_shift
    enigma = Enigma.new
    decrypt = Decrypt.new("02715", "040895")

    assert_equal [-3, -27, -73, -20], decrypt.decryption_shift
  end

  def test_rotate_letter
    enigma = Enigma.new
    decrypt = Decrypt.new("02715", "040895")
    assert_equal "h", decrypt.a_rotation("k", "02715", "040895")
    assert_equal "e", decrypt.b_rotation("e", "02715", "040895")
    assert_equal "l", decrypt.c_rotation("d", "02715", "040895")
    assert_equal "l", decrypt.d_rotation("e", "02715", "040895")
  end

  def test_it_can_decrypt
    enigma = Enigma.new
    decrypt = Decrypt.new("02715", "040895")
    assert_equal ({
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }), decrypt.decrypt("keder ohulw", "02715", "040895")
  end

end
