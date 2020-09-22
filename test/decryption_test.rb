require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/decryption'
require './lib/characters_list'

class DecryptionTest < Minitest::Test
  def test_it_exists_and_has_attributes
    decryption = Decryption.new
    decryption.stubs(:date).returns('040895')
    decryption.stubs(:key).returns('02715')

    assert_instance_of Decryption, decryption
    assert_equal "040895", decryption.date
    assert_equal "02715", decryption.key
  end

  def test_it_can_shift_key
    decryption = Decryption.new
    decryption.stubs(:key).returns('02715')

    assert_equal [02, 27, 71, 15], decryption.key_shift
  end

  def test_it_can_shift_date # test more later
    decryption = Decryption.new
    decryption.stubs(:date).returns('040895')

    assert_equal [1, 0, 2, 5], decryption.date_shift
  end

  def test_total_shift
    decryption = Decryption.new
    decryption.stubs(:date).returns('040895')
    decryption.stubs(:key).returns('02715')

    assert_equal [3, 27, 73, 20], decryption.total_shift
    assert_equal [3, 27, 73, 20], decryption.total_shift
  end

  def test_decryption_shift
    decryption = Decryption.new
    decryption.stubs(:date).returns('040895')
    decryption.stubs(:key).returns('02715')

    assert_equal [-3, -27, -73, -20], decryption.shift
  end

  def test_its_can_rotate_letter
    decryption = Decryption.new
    decryption.stubs(:date).returns('040895')
    decryption.stubs(:key).returns('02715')

    assert_equal "h", decryption.a_rotation("k")
    assert_equal "e", decryption.b_rotation("e")
    assert_equal "l", decryption.c_rotation("d")
    assert_equal "l", decryption.d_rotation("e")
  end

  def test_it_can_decrypt
    decryption = Decryption.new
    decryption.stubs(:date).returns('040895')
    decryption.stubs(:key).returns('02715')
    assert_equal ({
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }), decryption.decrypt("keder ohulw")
  end
end
