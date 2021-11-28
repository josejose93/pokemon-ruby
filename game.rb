require_relative "pokedex/pokemons"
require_relative "get_input"
require_relative "player"
require_relative "battle"

class Game
  include GetInput

  attr_reader :player

  # Initialize game with this prompt
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
    @player = nil
  end

  # Start the game
  def start
    name = input_name
    pokemon = input_pokemon(name)
    pokemon_name = input_pokemon_name(name, pokemon)
    @player = Player.new(name, pokemon, pokemon_name, 1)

    action = menu
    until action == "Exit"
      action = get_input("", obligatory: true)
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

  # Get the name of the player
  def input_name
    name = get_input("First, what is your name?", obligatory: true)
    puts "Right! So your name is #{name.upcase}!"
    puts "Your very own POKEMON legend is about to unfold! A world of"
    puts "dreams and adventures with POKEMON awaits! Let's go!"
    name
  end

  # Get the player's pokemon
  def input_pokemon(name_master)
    pokemons = Pokedex::POKEMONS.keys
    pokemons = pokemons.map(&:downcase).first(3)
    puts "Here, #{name_master.upcase}! There are 3 POKEMON here! Haha!"
    puts "When I was young, I was a serious POKEMON trainer."
    get_with_options("In my old age, I have only 3 left, but you can have one! Choose!\n\n", pokemons)
  end

  # Get the pokemon's name
  def input_pokemon_name(name_master, name_pokemon)
    puts "You selected #{name_pokemon.upcase}. Great choice!"
    pokemon_name = get_input("Give your pokemon a name?", obligatory: false)
    pokemon_name.empty? && (pokemon_name = name_pokemon)
    puts "#{name_master.upcase}, raise your young #{pokemon_name.upcase} by making it fight!"
    puts "When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"
    pokemon_name
  end

  # Find a battle to practice
  def train
    bot_train = BotRandom.new

    puts "#{@player.name.capitalize} challenge Random Person for training"
    puts "Random Person has a #{bot_train.pokemon.species} level #{bot_train.pokemon.level}"
    puts ""

    opciones = ["fight", "leave"]
    option = get_with_options("What do you want to do now?", opciones)
    option.downcase == "leave" && (return 0)
    battle = Battle.new(@player, bot_train)
    battle.start
  end

  # Battle with the gym leader
  def challenge_leader
    puts "#{@player.name} challenge the Gym Leader Brock for a fight!"
    puts "Brock has a Onix level 10"
    opciones = ["fight", "leave"]
    option = get_with_options("What do you want to do now?", opciones)
    option.downcase == "leave" && (return 0)
    bot_master = BotMaster.new
    battle = Battle.new(@player, bot_master)
    battle.start
    return unless battle.gym_winner == @player.pokemon

    puts "Congratulation! You have won the game!"
    puts "You can continue training your Pokemon if you want"
  end

  # Show stats of the pokemon's player
  def show_stats
    puts ""
    puts "#{@player.pokemon.name.capitalize}:"
    puts "Kind: #{@player.pokemon.species}"
    puts "Level: #{@player.pokemon.level}"
    puts "Type: #{@player.pokemon.type.join(', ')}"
    puts "Stats:"
    puts "HP: #{@player.pokemon.stats[:hp]}"
    puts "Attack: #{@player.pokemon.stats[:attack]}"
    puts "Defense: #{@player.pokemon.stats[:defense]}"
    puts "Special Attack: #{@player.pokemon.stats[:special_attack]}"
    puts "Special Defense: #{@player.pokemon.stats[:special_defense]}"
    puts "Speed: #{@player.pokemon.stats[:speed]}"
    puts "Experience Points: #{@player.pokemon.experience_points}"
  end

  # Goodbye message when exit the game
  def goodbye
    puts ""
    puts "Thanks for playing Pokemon Ruby"
    puts "This game was created with love by: Gaby Ortega, Ximena Calderón, José Pablo Alpaca Rivera, Eduardo salinas"
  end

  # Options from the menu
  def menu
    puts "-----------------------Menu-----------------------"
    puts ""
    puts "1. Stats        2. Train        3. Leader       4. Exit"
  end
end

game = Game.new
game.start
