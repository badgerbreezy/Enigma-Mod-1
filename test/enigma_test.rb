require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma

  end

  def test_it_can_generate_key
    enigma = Enigma.new
    enigma.stubs(:generate_key).returns('02715')

    assert_equal "02715", enigma.generate_key
    # binding.pry
  end

  def test_characters_as_hash
    enigma = Enigma.new

    assert_equal ({"a"=>1, "b"=>2, "c"=>3, "d"=>4, "e"=>5, "f"=>6, "g"=>7, "h"=>8, "i"=>9, "j"=>10, "k"=>11, "l"=>12, "m"=>13, "n"=>14, "o"=>15, "p"=>16, "q"=>17, "r"=>18, "s"=>19, "t"=>20, "u"=>21, "v"=>22, "w"=>23, "x"=>24, "y"=>25, "z"=>26, " "=>27}), enigma.characters_as_hash
  end

  def test_it_can_shift_key
    enigma = Enigma.new

    assert_equal [02, 27, 71, 15], enigma.key_shift("02715")
  end

  def test_it_can_shift_date # test more later
    enigma = Enigma.new
    assert_equal [1, 0, 2, 5], enigma.date_shift("040895")
  end

  def test_it_can_rotate_each_key
    enigma = Enigma.new
    enigma.stubs(:generate_key).returns('02715')

    assert_equal "02", enigma.a_rotation
    assert_equal "27", enigma.b_rotation
    assert_equal "71", enigma.c_rotation
    assert_equal "15", enigma.d_rotation
  end

  def test_total_shift
skip
    enigma = Enigma.new
    assert_equal [3, 27, 73, 20], enigma.total_shift("02715", "040895")
  end

  def test_it_can_encrypt
skip
    enigma = Enigma.new
    assert_equal ({
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }), enigma.encrypt("hello world", "02715", "040895")
  end

end
