require_relative "pokedex/pokemons"
require_relative "pokedex/moves"
require_relative "player"
require_relative "get_input"

# rubocop:disable Style/MixinUsage
include GetInput
# rubocop:enable Style/MixinUsage

def select_pokemon
  pokemons = Pokedex::POKEMONS.select { |name, _data| name }
  options = pokemons.keys
  get_with_options("Choose a character:", options.map(&:downcase).first(3))
end

name = get_input("What's your name?")
pokemon = select_pokemon
pokemon_name = get_input("Give your character a name:")

player = Player.new(name, pokemon, pokemon_name)
player.select_move

bot = Bot.new
bot.select_move

# battle = Battle.new(player, bot)
# battle.start
