# require neccesary files
require_relative "pokedex/pokemons"
require_relative "pokedex/moves"
require_relative "auxiliary_methods_pokemon"

class Pokemon
  # include neccesary modules
  include AuxiliaryMethods

  attr_reader :name, :type, :effort_points, :moves, :current_move, :growth_rate
  attr_accessor :experience_points, :stats, :stat_effort, :species

  # include neccesary modules
  # (complete parameters)
  def initialize(name, species, level = 1)
    # Retrieve pokemon info from Pokedex and set instance variables
    pokemon_details = Pokedex::POKEMONS[species]

    @name = name
    @species = species
    @type = pokemon_details[:type]
    @effort_points = pokemon_details[:effort_points]
    @base_stat = pokemon_details[:base_stats]
    @base_exp = pokemon_details[:base_exp]
    @growth_rate = pokemon_details[:growth_rate]
    @moves = pokemon_details[:moves]
    # Calculate Individual Values and store them in instance variable
    @stat_individual_value = calculate_individual_stats
    # Create instance variable with effort values. All set to 0
    @stat_effort = { hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }
    # Store the level in instance variable
    @level = level
    # If level is 1, set experience points to 0 in instance variable.
    # If level is not 1, calculate the minimum experience point for that level and store it in instance variable.
    @experience_points = get_experience(@level, @growth_rate)
    # Calculate pokemon stats and store them in instance variable
    @stats = get_stats(@level, @base_stat, @stat_individual_value, @stat_effort)
    @current_move = nil
  end

  def prepare_for_battle
    # Complete this
    @hp = @stats[:hp]
    @current_move = nil
  end

  def receive_damage
    # Complete this
    @hp -= damage
  end

  def set_current_move(move)
    # Complete this
    @current_move = move
  end

  def fainted?
    # Complete this
    !@hp.positive?
  end

  def attack(target)
    # Print attack message 'Tortuguita used MOVE!'
    puts "#{@name} used #{@current_move[:name]}"
    # Accuracy check
    hits = @current_move[:accuracy] >= rand(1..100)
    # If the movement is not missed
    if hits
      # -- Calculate base damage
      damage = base_damage(@level, @stats, @current_move, target)
      # -- Critical Hit check
      if critical_hit
        # -- If critical, multiply base damage and print message 'It was CRITICAL hit!'
        damage *= 1.5
        puts "It was CRITICAL hit!"
      end
      # -- Effectiveness check
      effectiveness_multiplier = get_effectiveness_multiplier(@current_move, target)
      # -- Mutltiply damage by effectiveness multiplier and round down. Print message if neccesary
      damage *= effectiveness_multiplier

      print_effectiveness(effectiveness_multiplier, target)

      # -- Inflict damage to target and print message "And it hit [target name] with [damage] damage""
      target.stats[:hp] -= damage
      puts "And it hit #{target.name} with #{damage} damage"
    # Else, print "But it MISSED!"
    else
      puts "But it MISSED!"
    end
  end

  def increase_stats(target)
    # Increase stats base on the defeated pokemon and print message "#[pokemon name] gained [amount] experience points"
    gained_experience = (target.experience * target.level / 7).floor
    @experience_points += gained_experience

    # Re-observar si la formula de esta funcion es correcta
    @stat_effort[target.effort_points[:type]] += target.effort_points[:amount]

    puts "#{@name} gained #{gained_experience} experience points"
    # If the new experience point are enough to level up, do it and print
    return unless @experience_points > get_experience(@level + 1)

    @level += 1
    # message "#[pokemon name] reached level [level]!" # -- Re-calculate the stat
    puts "#{@name} reached level #{@level}!" # -- Re-calculate the stat
    @stats = get_stats(@level, @base_stat, @stat_individual_value, @stat_effort)
  end
  # private methods:
end

xime = Pokemon.new("Proxe", "Charmander", 1)
p xime.stats
# puts xime.moves
# move = gets.chomp
# move = Pokedex::MOVES[move]
# p move
# current_move = xime.set_current_move(move)
# p current_move