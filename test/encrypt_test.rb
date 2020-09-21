require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/encrypt'
require './lib/encrypt'
require './lib/characters_list'

class EncryptTest < Minitest::Test
  def test_it_exists_and_has_attributes
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt = Encrypt.new
    encrypt.stubs(:key).returns('02715')


    assert_instance_of Encrypt, encrypt
    assert_equal "040895", encrypt.date
    assert_equal "02715", encrypt.key

  end

  def test_it_can_generate_key
    encrypt = Encrypt.new
    encrypt.stubs(:generate_key).returns('02715')

    assert_equal "02715", encrypt.generate_key
  end

  def test_it_can_shift_key
    encrypt = Encrypt.new
    encrypt.stubs(:key).returns('02715')
    assert_equal "02715", encrypt.key

    assert_equal [02, 27, 71, 15], encrypt.key_shift
  end

  def test_it_can_generate_date # test more later
    encrypt = Encrypt.new
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt.stubs(:key).returns('02715')
    assert_equal [6, 4, 0, 0], encrypt.date_shift
  end

  def test_total_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt = Encrypt.new
    encrypt.stubs(:key).returns('02715')
    assert_equal [3, 27, 73, 20], encrypt.total_shift
    assert_equal [3, 27, 73, 20], encrypt.total_shift
  end

  def test_rotate_letter
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt = Encrypt.new
    encrypt.stubs(:key).returns('02715')
    assert_equal "k", encrypt.a_rotation("h")
    assert_equal "e", encrypt.b_rotation("e")
    assert_equal "d", encrypt.c_rotation("l")
    assert_equal "e", encrypt.d_rotation("l")
  end

  def test_it_can_encrypt
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypt = Encrypt.new
    encrypt.stubs(:key).returns('02715')
    assert_equal ({:encryption =>"keder ohulw", :key => "02715", :date=> "040895"}), encrypt.encrypt("hello world")
  end
end
