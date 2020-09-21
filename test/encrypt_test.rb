require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/encrypt'
require './lib/encrypt'
require './lib/characters_list'

class EncryptTest < Minitest::Test
  def test_it_exists
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt = Encrypt.new("02715")

    assert_instance_of Encrypt, encrypt
    assert_equal "040895", enigma.date
  end

  def test_it_can_generate_key
    encrypt = Encrypt.new("02715")
    encrypt.stubs(:generate_key).returns('02715')

    assert_equal "02715", encrypt.generate_key
  end

  def test_it_can_shift_key
    encrypt = Encrypt.new("02715")

    assert_equal [02, 27, 71, 15], encrypt.key_shift("02715")
  end

  def test_it_can_generate_date # test more later
    encrypt = Encrypt.new("02715")
    Date.stubs(:today).returns(Date.new(1995,8,4))
    assert_equal [6, 4, 0, 0], encrypt.date_shift
  end

  def test_total_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt = Encrypt.new("02715")
    assert_equal [3, 27, 73, 20], encrypt.total_shift("02715")
    assert_equal [3, 27, 73, 20], encrypt.total_shift("02715")
  end

  def test_encryption_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt = Encrypt.new("02715")

    assert_equal [3, 27, 73, 20], encrypt.total_shift("02715")
  end

  def test_rotate_letter
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt = Encrypt.new("02715")
    assert_equal "k", encrypt.a_rotation("h", "02715")
    assert_equal "e", encrypt.b_rotation("e", "02715")
    assert_equal "d", encrypt.c_rotation("l", "02715")
    assert_equal "e", encrypt.d_rotation("l", "02715")
  end

  def test_it_can_encrypt
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt = Encrypt.new("02715")
    assert_equal ({:encryption=>"keder ohulw", :key=>"02715"}), encrypt.encrypt("hello world", "02715")
  end
end
