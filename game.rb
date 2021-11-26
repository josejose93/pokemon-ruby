# require neccesary files
require_relative "pokedex/pokemons"
require_relative "welcome_messages"

include Messages

class Game
  def initialize
    @name = ""
    @pokemon = ""
    @pokemon_name = ""
  end

  def start
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
    # Then create a Player with that information and store it in @player
    # Suggested game flow
    # action = menu
    #   until action == "Exit"
    #     case action
    #     when "Train"
    #       train
    #       action = menu
    #     when "Leader"
    #       challenge_leader
    #       action = menu
    #     when "Stats"
    #       show_stats
    #       action = menu
    #     end
    #   end
    #   goodbye
    # def train
    #   # Complete this
    # end

    # def challenge_leader
    #   # Complete this
    # end

    # def show_stats
    #   # Complete this
    # end

    # def goodbye
    #   # Complete this
    # end

    # def menu
    #   # Complete this
    # end
  end
  # Create a welcome method(s) to get the name, pokemon and pokemon_name from the user
  def welcome
    puts "First, what is your name?"
    print "> "
    name = gets.chomp
    @name = name
    message_three
    pokemon = gets.chomp.downcase
    pokemons = Pokedex::POKEMONS.keys
    pokemons = pokemons.map(&:downcase)
    pokemons_available = pokemons.first(3)
    until pokemons_available.include?(pokemon)
      puts "Pokemon not available"
      puts "> "
      pokemon = gets.chomp.downcase
    end
    @pokemon = pokemon
    puts "You selected #{@pokemon.upcase}. Great choice!"
    puts "Give your pokemon a name?"
    print "> "
    @pokemon_name = gets.chomp
    @pokemon_name.empty? && (@pokemon_name = @pokemon)
    p @pokemon_name.capitalize
  end
end

game = Game.new
game.start
game.welcome
