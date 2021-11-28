require_relative "pokedex/pokemons"
require_relative "pokedex/moves"
require_relative "auxiliary_methods_pokemon"

class Pokemon
  include AuxiliaryMethods

  attr_reader :name, :type, :effort_points, :moves, :current_move, :growth_rate, :level, :base_exp
  attr_accessor :experience_points, :stats, :stat_effort, :species

  def initialize(name, species, level = 1)
    pokemon_details = Pokedex::POKEMONS[species]

    @name = name
    @species = species
    @type = pokemon_details[:type]
    @effort_points = pokemon_details[:effort_points]
    @base_stat = pokemon_details[:base_stats]
    @base_exp = pokemon_details[:base_exp]
    @growth_rate = pokemon_details[:growth_rate]
    @moves = pokemon_details[:moves]

    @stat_individual_value = calculate_individual_stats
    @stat_effort = { hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }
    @level = level
    @experience_points = get_experience(@level, @growth_rate)
    @stats = get_stats(@level, @base_stat, @stat_individual_value, @stat_effort)
    @current_move = nil
  end

  # resets pokemon health and current_moves for upcoming battle
  def prepare_for_battle
    @stats = get_stats(@level, @base_stat, @stat_individual_value, @stat_effort)
    @current_move = nil
  end

  # lowers pokemon hp according to damage
  def receive_damage
    @stats[:hp] -= damage
  end

  # stores the current move as a hash, related to the moves in Pokedex::MOVES
  def set_current_move(move)
    @current_move = move
  end

  # verifies pokemon hp to check if fainted
  def fainted?
    !@stats[:hp].positive?
  end

  # damages target if hits, and adds up critical and effectiveness damage if applied
  def attack(target)
    puts "#{@name.capitalize} used #{@current_move[:name]}"

    hits = @current_move[:accuracy] >= rand(1..100)
    if hits
      damage = base_damage(@level, @stats, @current_move, target)

      if critical_hit
        damage *= 1.5
        puts "It was CRITICAL hit!"
      end
      effectiveness_multiplier = get_effectiveness_multiplier(@current_move, target)
      damage *= effectiveness_multiplier

      print_effectiveness(effectiveness_multiplier, target)

      target.stats[:hp] -= damage
      puts "And it hit #{target.name} with #{damage.floor} damage"
    else
      puts "But it MISSED!"
    end
  end

  # Increase stats, experience and level if the necessary experience is reached
  def increase_stats(target)
    gained_experience = (target.base_exp * target.level / 7).floor
    @experience_points += gained_experience

    @stat_effort[target.effort_points[:type]] += target.effort_points[:amount]

    puts "#{@name} gained #{gained_experience} experience points"
    return unless @experience_points > get_experience(@level + 1, @growth_rate)

    @level += 1
    puts "#{@name} reached level #{@level}!"
    @stats = get_stats(@level, @base_stat, @stat_individual_value, @stat_effort)
  end
end
