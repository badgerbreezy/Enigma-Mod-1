require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/decrypt'
require './lib/characters_list'

class DecryptTest < Minitest::Test
  def test_it_exists
    Date.stubs(:today).returns(Date.new(1995,8,4))
    decrypt = Decrypt.new("02715")

    assert_instance_of Decrypt, decrypt
  end

  def test_it_can_generate_key
    decrypt = Decrypt.new("02715")
    decrypt.stubs(:generate_key).returns('02715')

    assert_equal "02715", decrypt.generate_key
  end

  def test_it_can_shift_key
    decrypt = Decrypt.new("02715")

    assert_equal [02, 27, 71, 15], decrypt.key_shift("02715")
  end

  def test_it_can_generate_date # test more later
    decrypt = Decrypt.new("02715")
    Date.stubs(:today).returns(Date.new(1995,8,4))
    assert_equal [6, 4, 0, 0], decrypt.date_shift
  end

  def test_total_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    decrypt = Decrypt.new("02715")
    assert_equal [3, 27, 73, 20], decrypt.total_shift("02715")
    assert_equal [3, 27, 73, 20], decrypt.total_shift("02715")
  end

  def test_decryption_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    decrypt = Decrypt.new("02715")

    assert_equal [-3, -27, -73, -20], decrypt.decryption_shift("02715")
  end

  def test_rotate_letter
    Date.stubs(:today).returns(Date.new(1995,8,4))
    decrypt = Decrypt.new("02715")
    assert_equal "h", decrypt.a_rotation("k", "02715")
    assert_equal "e", decrypt.b_rotation("e", "02715")
    assert_equal "l", decrypt.c_rotation("d", "02715")
    assert_equal "l", decrypt.d_rotation("e", "02715")
  end

  def test_it_can_decrypt
    Date.stubs(:today).returns(Date.new(1995,8,4))
    decrypt = Decrypt.new("02715")
    assert_equal ({
        decryption: "hello world",
        key: "02715"
      }), decrypt.decrypt("keder ohulw", "02715")
  end
end
