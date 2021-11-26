# require neccesary files
require_relative "pokedex/pokemons"
require_relative "pokedex/moves"
require_relative "pokemon"
require_relative "get_input"

class Player
  # (Complete parameters)
  include GetInput
  attr_reader :pokemon, :name

  def initialize(name, species, pokemon_name)
    # Complete this
    @name = name
    @pokemon = Pokemon.new(species, pokemon_name)
  end

  def select_move
    # Complete this
    move = get_with_options("Select a move to attack", @pokemon.moves)
    @pokemon.current_move = Pokedex::MOVES[move]
  end
end

class Bot < Player
  def initialize
    bot_pokemons = Pokedex::POKEMONS.select { |name, _data| name }
    options = bot_pokemons.keys
    selected_pokemon = options.sample
    print super("Random Person", selected_pokemon, selected_pokemon.capitalize)
  end

  def select_move
    print move = @pokemon.moves.sample
    @pokemon.current_move = Pokedex::MOVES[move]
  end
end
