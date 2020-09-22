require 'minitest/autorun'
require 'minitest/pride'
require 'Pry'
require 'mocha/minitest'
require './lib/characters_list'

class CharactersListTest < Minitest::Test
  def test_it_exists_and_has_attributes
    characters_list = CharactersList.new

    assert_instance_of CharactersList, characters_list
  end

  def test_length_of_characters_list
    characters_list = CharactersList.new
    assert_equal 27, characters_list.characters.length 
  end
end
