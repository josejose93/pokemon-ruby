# Create here auxiliary methods
module AuxiliaryMethods
  def calculate_individual_stats
    stat_individual_value = {}
    key_stats = %i[hp attack defense special_attack special_defense speed]
    key_stats.each do |element|
      stat_individual_value.store(element, rand(0..31))
    end
    stat_individual_value
  end

  # get_stats: determina los stats del jugador según formúlas de especificaciones
  def get_stats(level, base_stat, stat_individual_value, stat_effort)
    stats = {}

    stats[:hp] =
      ((((2 * base_stat[:hp]) + stat_individual_value[:hp] + stat_effort[:hp]) * level / 100) + level + 10).floor

    base_stat.each_key do |key|
      stats[key] = ((((2 * base_stat[key]) + stat_individual_value[key] + stat_effort[key]) * level / 100) + 5).floor
    end
    stats
  end

  # get_experience: calcula el minimo de experiencia inicial que necesita cada nivel
  def get_experience(level, growth_rate)
    if level == 1
      experience = 0
    elsif level > 1
      experience = Pokedex::LEVEL_TABLES[growth_rate][level - 1]
    end
    experience
  end

  # base_damage:calcula daño base (antes de criticos y efectividad) segun tipo de movimiento y tipo del target
  def base_damage(level, stats, move, target)
    if (Pokedex::SPECIAL_MOVE_TYPE.find { |category| category == move[:type] }).nil?
      offensive_stat = stats[:attack]
      target_defensive_stat = target.stats[:defense]
    else
      offensive_stat = stats[:special_attack]
      target_defensive_stat = target.stats[:special_defense]
    end
    move_power = move[:power]

    ((((2 * level / 5.0) + 2).floor * offensive_stat * move_power / target_defensive_stat).floor / 50.0).floor + 2
  end

  def critical_hit
    (1 / 16) * 100 >= rand(1..100)
  end

  def get_effectiveness_multiplier(move, target)
    effectiveness_multiplier = 1
    target.type.each do |type|
      effectiveness = Pokedex::TYPE_MULTIPLIER.find do |hash|
        hash[:user] == move[:type] && hash[:target] == type
      end
      effectiveness_multiplier *= effectiveness[:multiplier]
    end
    effectiveness_multiplier
  end

  def print_effectiveness(multiplier, target)
    if multiplier <= 0.5
      # ---- "It's not very effective..." when effectivenes is less than or equal to 0.5
      puts "It's not very effective..."
    elsif multiplier >= 1.5
      # ---- "It's super effective!" when effectivenes is greater than or equal to 1.5
      puts "It's super effective!"
    elsif multiplier.zero?
      # ---- "It doesn't affect [target name]!" when effectivenes is 0
      puts "It doesn't affect #{target.name}!"
    end
  end
end
