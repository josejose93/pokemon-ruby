require_relative "pokedex/pokemons"
require_relative "pokedex/moves"
require_relative "pokemon"
require_relative "get_input"

class Player
  include GetInput
  attr_reader :pokemon, :name

  # call pokemon class for create a new pokemon player
  def initialize(name, species, pokemon_name, level)
    @name = name
    @pokemon = Pokemon.new(pokemon_name, species, level)
  end

  # select a move to pokemon player
  def select_move
    move = get_with_options("Select a move to attack", @pokemon.moves).downcase
    @pokemon.set_current_move(Pokedex::MOVES[move])
  end
end

# create Bot class using Player class inheritance
class Bot < Player
  def select_move
    move = @pokemon.moves.sample
    @pokemon.set_current_move(Pokedex::MOVES[move])
  end
end

# create BotMaster class using Bot class inheritance
class BotMaster < Bot
  # create a master bot to fight in the gym and assing a pokemon
  def initialize
    super("Brock", "Onix", "Onix", 10)
  end

  # select a random move to bot master
  def select_move
    move = @pokemon.moves.sample
    @pokemon.set_current_move(Pokedex::MOVES[move])
  end
end

# create BotRandom class using Bot class inheritance
class BotRandom < Bot
  # create a random bot to fight a player and assing a random pokemon
  def initialize
    list_pokemons = Pokedex::POKEMONS.keys
    selected_pokemon = list_pokemons.sample
    level = rand(1..10)
    super("Random Person", selected_pokemon, selected_pokemon.capitalize, level)
  end

  # select a random move to bot master
  def select_move
    move = @pokemon.moves.sample
    @pokemon.set_current_move(Pokedex::MOVES[move])
  end
end
