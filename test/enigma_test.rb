require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/enigma'
require './lib/encrypt'
require './lib/decrypt'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    encrypt = Encrypt.new("02715")

    assert_instance_of Enigma, enigma
    assert_equal "040895", enigma.date
  end

  def test_it_can_generate_key
    enigma = Enigma.new
    encrypt = Encrypt.new("02715")
    enigma.stubs(:generate_key).returns('02715')

    assert_equal "02715", enigma.generate_key
  end

  def test_it_can_shift_key
    enigma = Enigma.new
    encrypt = Encrypt.new("02715")

    assert_equal [02, 27, 71, 15], enigma.key_shift("02715")
  end

  def test_it_can_generate_date # test more later
    enigma = Enigma.new
    encrypt = Encrypt.new("02715")
    Date.stubs(:today).returns(Date.new(1995,8,4))
    assert_equal [6, 4, 0, 0], enigma.date_shift
  end

  def test_total_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    encrypt = Encrypt.new("02715")
    assert_equal [3, 27, 73, 20], enigma.total_shift("02715")
    assert_equal [3, 27, 73, 20], enigma.total_shift("02715")
  end

  def test_it_can_encrypt_and_decrypt
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    encrypt = Encrypt.new("02715")

    encrypted = enigma.encrypt("hello world", "02715")
    assert_equal assert_equal ({
        decryption: "hello world",
        key: "02715"
      }), enigma.decrypt(encrypted[:encryption], "02715")
  end

end
