# require neccesary files
require_relative "pokedex/pokemons"
require_relative "get_input"
require_relative "player"

class Game
  include GetInput
  def initialize
    puts ""
    puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#"
    puts "#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#"
    puts "#$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#"
    puts "#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#"
    puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#"
    puts ""
    puts "Hello there! Welcome to the world of POKEMON! My name is OAK!"
    puts "People call me the POKEMON PROF!"
    puts ""
    puts "This world is inhabited by creatures called POKEMON! For some"
    puts "people, POKEMON are pets. Others use them for fights. Myself..."
    puts "I study POKEMON as a profession."
  end

  def start
    name = input_name
    pokemon = input_pokemon(name)
    pokemon_name = input_pokemon_name(name, pokemon)
    # Then create a Player with that information and store it in @player
    @player = Player.new(name, pokemon, pokemon_name)

    # Suggested game flow
    action = menu
    until action == "Exit"
      action = get_input("", true)
      case action
      when "Train"
        train
        action = menu
      when "Leader"
        challenge_leader
        action = menu
      when "Stats"
        show_stats
        action = menu
      end
    end
    goodbye
  end

  # Create a welcome method(s) to get the name, pokemon and pokemon_name from the user
  def input_name
    name = get_input("First, what is your name?")
    puts "Right! So your name is #{name.upcase}!"
    puts "Your very own POKEMON legend is about to unfold! A world of"
    puts "dreams and adventures with POKEMON awaits! Let's go!"
    name
  end

  def input_pokemon(name_master)
    pokemons = Pokedex::POKEMONS.keys
    pokemons = pokemons.map(&:downcase).first(3)
    puts "Here, #{name_master.upcase}! There are 3 POKEMON here! Haha!"
    puts "When I was young, I was a serious POKEMON trainer."
    get_with_options("In my old age, I have only 3 left, but you can have one! Choose!\n\n", pokemons)
  end

  def input_pokemon_name(name_master, name_pokemon)
    puts "You selected #{name_pokemon.upcase}. Great choice!"
    pokemon_name = get_input("Give your pokemon a name?", false)
    pokemon_name.empty? && (pokemon_name = name_pokemon)
    puts "#{name_master.upcase}, raise your young #{pokemon_name.upcase} by making it fight!"
    puts "When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"
    pokemon_name
  end

  def train
    # Complete this
    puts "#{@player.name} challenge Random Person for training"
    puts "Random Person has a Onix level 4"
    puts "What do you want to do now?"
  end

  def challenge_leader
    # Complete this
  end

  def show_stats
    # Complete this
  end

  def goodbye
    # Complete this
    puts "good bye"
  end

  def menu
    # Complete this
    puts "-----------------------Menu-----------------------"
    puts ""
    puts "1. Stats        2. Train        3. Leader       4. Exit"
  end
end

game = Game.new
game.start
