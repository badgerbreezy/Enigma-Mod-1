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

  def test_it_can_shift_key
    enigma = Enigma.new

    assert_equal [02, 27, 71, 15], enigma.key_shift("02715")
  end

  def test_it_can_shift_date # test more later
    enigma = Enigma.new
    assert_equal [1, 0, 2, 5], enigma.date_shift("040895")
  end

  def test_total_shift

    enigma = Enigma.new
    assert_equal [3, 27, 73, 20], enigma.total_shift("02715", "040895")
  end

  def test_it_can_encrypt
    
    enigma = Enigma.new
    assert_equal ({
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }), enigma.encrypt("hello world", "02715", "040895")
  end

end
