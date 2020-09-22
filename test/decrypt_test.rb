require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/decrypt'
require './lib/characters_list'

class DecryptTest < Minitest::Test
  def test_it_exists_and_has_attributes
    Date.stubs(:today).returns(Date.new(1995,8,4))
    decrypt = Decrypt.new
    decrypt.stubs(:key).returns('02715')

    assert_instance_of Decrypt, decrypt
    assert_equal "040895", decrypt.date
    assert_equal "02715", decrypt.key
  end

  def test_it_can_generate_key
    decrypt = Decrypt.new
    decrypt.stubs(:generate_key).returns('02715')

    assert_equal "02715", decrypt.generate_key
  end

  def test_it_can_shift_key
    decrypt = Decrypt.new
    decrypt.stubs(:key).returns('02715')

    assert_equal [02, 27, 71, 15], decrypt.key_shift
  end

  def test_it_can_generate_date # test more later
    decrypt = Decrypt.new
    Date.stubs(:today).returns(Date.new(1995,8,4))

    assert_equal [6, 4, 0, 0], decrypt.date_shift
  end

  def test_total_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    decrypt = Decrypt.new
    decrypt.stubs(:key).returns('02715')

    assert_equal [3, 27, 73, 20], decrypt.total_shift
    assert_equal [3, 27, 73, 20], decrypt.total_shift
  end

  def test_decryption_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    decrypt = Decrypt.new
    decrypt.stubs(:key).returns('02715')

    assert_equal [-3, -27, -73, -20], decrypt.decryption_shift
  end

  def test_rotate_letter
    Date.stubs(:today).returns(Date.new(1995,8,4))
    decrypt = Decrypt.new
    decrypt.stubs(:key).returns('02715')

    assert_equal "h", decrypt.a_rotation("k")
    assert_equal "e", decrypt.b_rotation("e")
    assert_equal "l", decrypt.c_rotation("d")
    assert_equal "l", decrypt.d_rotation("e")
  end

  def test_it_can_decrypt
    Date.stubs(:today).returns(Date.new(1995,8,4))
    decrypt = Decrypt.new
    decrypt.stubs(:key).returns('02715')
    assert_equal ({
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }), decrypt.decrypt("keder ohulw")
  end
end
