require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/encrypt'

class EncryptTest < Minitest::Test
  def test_it_exists
    encrypt = Encrypt.new

    assert_instance_of Encrypt, encrypt
  end
end
