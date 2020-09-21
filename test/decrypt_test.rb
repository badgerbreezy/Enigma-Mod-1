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

  def test_total_shift
    enigma = Enigma.new
    decrypt = Decrypt.new("02715", "040895")

    assert_equal [3, 27, 73, 20], decrypt.total_shift("02715", "040895")
  end

  def test_rotate_letter
    enigma = Enigma.new
    decrypt = Decrypt.new("02715", "040895")
    assert_equal "k", decrypt.a_rotation("h", "02715", "040895")
    assert_equal "e", decrypt.b_rotation("e", "02715", "040895")
    assert_equal "d", decrypt.c_rotation("l", "02715", "040895")
    assert_equal "e", decrypt.d_rotation("l", "02715", "040895")
  end

  def test_it_can_decrypt
    enigma = Enigma.new
    decrypt = Decrypt.new("02715", "040895")
    assert_equal ({
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }), decrypt.decrypt("hello world", "02715", "040895")
  end
end
