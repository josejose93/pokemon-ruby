require_relative "pokedex/pokemons"
require_relative "pokedex/moves"
require_relative "pokemon"
require_relative "get_input"

class Player
  include GetInput
  attr_reader :pokemon, :name

  def initialize(name, species, pokemon_name, level)
    @name = name
    @pokemon = Pokemon.new(pokemon_name, species, level)
  end

  def select_move
    move = get_with_options("Select a move to attack", @pokemon.moves).downcase
    @pokemon.set_current_move(Pokedex::MOVES[move])
  end
end

class Bot < Player
  def select_move
    move = @pokemon.moves.sample
    @pokemon.set_current_move(Pokedex::MOVES[move])
  end
end

class BotMaster < Bot
  def initialize
    super("Brock", "Onix", "Onix", 10)
  end

  def select_move
    move = @pokemon.moves.sample
    @pokemon.set_current_move(Pokedex::MOVES[move])
  end
end

class BotRandom < Bot
  def initialize
    list_pokemons = Pokedex::POKEMONS.keys
    selected_pokemon = list_pokemons.sample
    level = rand(1..10)
    super("Random Person", selected_pokemon, selected_pokemon.capitalize, level)
  end

  def select_move
    move = @pokemon.moves.sample
    @pokemon.set_current_move(Pokedex::MOVES[move])
  end
end
