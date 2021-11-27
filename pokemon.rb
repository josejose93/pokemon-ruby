# require neccesary files
require_relative "pokedex/pokemons"
require_relative "pokedex/moves"

class Pokemon
  # include neccesary modules
  attr_reader :name, :type, :effort_points, :moves, :current_move, :growth_rate
  attr_accessor :experience_points, :stats, :stat_effort,:species

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
    @stat_individual_value = {
      hp: rand(0..31),
      attack: rand(0..31),
      defense: rand(0..31),
      special_attack: rand(0..31),
      special_defense: rand(0..31),
      speed: rand(0..31)
    }
    # Create instance variable with effort values. All set to 0
    @stat_effort = { hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }
    # Store the level in instance variable
    @level = level
    # If level is 1, set experience points to 0 in instance variable.
    # If level is not 1, calculate the minimum experience point for that level and store it in instance variable.
    @experience_points = get_experience(@level)
    # Calculate pokemon stats and store them in instance variable
    @stats = get_stats(@base_stat)
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

  def set_current_move
    # Complete this
    @current_move = Pokedex::MOVES.find { |key, _value| key == move }
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
      damage = base_damage(@current_move, target)
      # -- Critical Hit check
      if critical_hit
        # -- If critical, multiply base damage and print message 'It was CRITICAL hit!'
        damage *= 1.5
        puts "It was CRITICAL hit!"
      end
      # -- Effectiveness check

      target.type.each do |type|
        effectiveness = TYPE_MULTIPLIER.find do |hash|
          hash[:user] == @current_move[:type] && hash[:target] == type
        end
        effectiveness_multiplier = 1
        effectiveness_multiplier *= effectiveness[:multiplier]
      end
      # -- Mutltiply damage by effectiveness multiplier and round down. Print message if neccesary
      damage *= effectiveness_multiplier

      if effectiveness_multiplier <= 0.5
        # ---- "It's not very effective..." when effectivenes is less than or equal to 0.5
        puts "It's not very effective..."
      elsif effectiveness_multiplier >= 1.5
        # ---- "It's super effective!" when effectivenes is greater than or equal to 1.5
        puts "It's super effective!"
      elsif effectiveness_multiplier.zero?
        # ---- "It doesn't affect [target name]!" when effectivenes is 0
        puts "It doesn't affect #{target.name}!"
      end

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
    if @experience_points > get_experience(@level + 1)
      @level += 1
      # message "#[pokemon name] reached level [level]!" # -- Re-calculate the stat
      puts "#{@name} reached level #{@level}!" # -- Re-calculate the stat
      @stats = get_stats(@base_stat)
    end
  end

  # private methods:
  # Create here auxiliary methods

  # get_stats: determina los stats del jugador según formúlas de especificaciones
  def get_stats(base_stat)
    stats = {}

    stats[:hp] = ((((2 * base_stat[:hp]) + @stat_individual_value[:hp] + @stat_effort[:hp]) * @level / 100) + @level + 10).floor
    

    base_stat.each_key do |key|
      stats[key] = ((((2 * base_stat[key]) + @stat_individual_value[key] + @stat_effort[key]) * @level / 100) + 5).floor
    end
    stats
  end

  # get_experience: calcula el minimo de experiencia inicial que necesita cada nivel
  def get_experience(level)
    if level == 1
      experience = 0
    elsif level > 1
      experience = Pokedex::LEVEL_TABLES[@growth_rate][level - 1]
    end
    experience
  end

  # base_damage:calcula daño base (antes de criticos y efectividad) segun tipo de movimiento y tipo del target
  def base_damage(move, target)
    if (Pokedex::SPECIAL_MOVE_TYPE.find { |category| category == move[:type] }).nil?
      offensive_stat = @stats[:attack]
      target_defensive_stat = target.stats[:defense]
    else
      offensive_stat = @stats[:special_attack]
      target_defensive_stat = target.stats[:special_defense]
    end
    move_power = move[:power]

    ((((2 * @level / 5.0) + 2).floor * offensive_stat * move_power / target_defensive_stat).floor / 50.0).floor + 2
  end

  def critical_hit
    (1 / 16) * 100 >= rand(1..100)
  end
end
