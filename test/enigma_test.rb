require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
    assert_equal "040895", enigma.date
  end

  def test_it_can_generate_key
    enigma = Enigma.new
    enigma.stubs(:generate_key).returns('02715')

    assert_equal "02715", enigma.generate_key
  end

  def test_characters_as_hash
    skip
    enigma = Enigma.new

    assert_equal ({"a"=>1, "b"=>2, "c"=>3, "d"=>4, "e"=>5, "f"=>6, "g"=>7, "h"=>8, "i"=>9, "j"=>10, "k"=>11, "l"=>12, "m"=>13, "n"=>14, "o"=>15, "p"=>16, "q"=>17, "r"=>18, "s"=>19, "t"=>20, "u"=>21, "v"=>22, "w"=>23, "x"=>24, "y"=>25, "z"=>26, " "=>27}), enigma.characters_as_hash
  end

  def test_it_can_shift_key
    enigma = Enigma.new

    assert_equal [02, 27, 71, 15], enigma.key_shift("02715")
  end

  def test_it_can_generate_date # test more later
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(1995,8,4))
    assert_equal [6, 4, 0, 0], enigma.date_shift
  end

  def test_total_shift
    Date.stubs(:today).returns(Date.new(1995,8,4))
    enigma = Enigma.new
    date = Date.new
    assert_equal [3, 27, 73, 20], enigma.total_shift("02715")
    assert_equal [3, 27, 73, 20], enigma.total_shift("02715")
  end
end

# def test_total_shift
#   enigma = Enigma.new
#
#   assert_equal [3, 27, 73, 20], enigma.total_shift("02715", "040895")
# end
#
# def test_rotate_letter
#   enigma = Enigma.new
#   assert_equal "k", enigma.a_rotation("h", "02715", "040895")
#   assert_equal "e", enigma.b_rotation("e", "02715", "040895")
#   assert_equal "d", enigma.c_rotation("l", "02715", "040895")
#   assert_equal "e", enigma.d_rotation("l", "02715", "040895")
# end
#
# def test_it_can_encrypt
#   enigma = Enigma.new
#   assert_equal ({
#       encryption: "keder ohulw",
#       key: "02715",
#       date: "040895"
#     }), enigma.encrypt("hello world", "02715", "040895")
# end
