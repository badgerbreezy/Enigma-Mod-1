require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/encryption'
require './lib/characters_list'

class EncryptionTest < Minitest::Test
  def test_it_exists_and_has_attributes
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encryption = Encryption.new
    encryption.stubs(:key).returns('02715')


    assert_instance_of Encryption, encryption
    assert_equal "040895", encryption.date
    assert_equal "02715", encryption.key

  end

  def test_it_can_generate_key
    encryption = Encryption.new
    encryption.stubs(:generate_key).returns('02715')

    assert_equal "02715", encryption.generate_key
  end

  def test_it_can_shift_key
    encryption = Encryption.new
    encryption.stubs(:key).returns('02715')
    assert_equal "02715", encryption.key

    assert_equal [02, 27, 71, 15], encryption.key_shift
  end

  def test_it_can_generate_date # test more later
    encryption = Encryption.new
    Date.stubs(:today).returns(Date.new(1995,8,4))
    assert_equal [6, 4, 0, 0], encryption.date_shift
  end

  def test_total_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encryption = Encryption.new
    encryption.stubs(:key).returns('02715')

    assert_equal [3, 27, 73, 20], encryption.total_shift
    assert_equal [3, 27, 73, 20], encryption.total_shift
  end

  def test_rotate_letter
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encryption = Encryption.new
    encryption.stubs(:key).returns('02715')

    assert_equal "k", encryption.a_rotation("h")
    assert_equal "e", encryption.b_rotation("e")
    assert_equal "d", encryption.c_rotation("l")
    assert_equal "e", encryption.d_rotation("l")
  end

  def test_it_can_encrypt
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encryption = Encryption.new
    encryption.stubs(:key).returns('02715')
    assert_equal ({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }), encryption.encrypt("hello world")
  end
end
