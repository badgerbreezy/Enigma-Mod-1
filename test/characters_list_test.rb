require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require 'date'
require './lib/enigma'
require './lib/encrypt'
require './lib/characters_list'

class CharactersList < Minitest::Test
  def test_it_exists_and_has_attributes
    characters_list = CharactersList.new

    assert_instance_of CharactersList, characters_list
  end
end
