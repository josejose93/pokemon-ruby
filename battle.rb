require_relative "player"

class Battle
  attr_reader :gym_winner

  def initialize(player, bot)
    @player = player
    @bot = bot
    @player_pokemon = @player.pokemon
    @bot_pokemon = @bot.pokemon
    @gym_winner = nil
  end

  def start
    print "\n"
    puts "#{@bot.name} sent out #{@bot.pokemon.name}!"
    puts "#{@player.name} sent out #{@player.pokemon.name}!"
    puts "-------------------Battle Start!-------------------"
    print "\n"

    print_lives_players

    print "\n"

    battle_loop

    winner = @player_pokemon.fainted? ? @bot_pokemon : @player_pokemon
    losser = winner == @player_pokemon ? @bot_pokemon : @player_pokemon

    (winner == @player_pokemon) && winner.increase_stats(losser)
    puts "#{winner.name} WINS!"
    puts "#{winner.name} WINS! gained #{winner.experience_points} points"
    puts "-------------------Battle Ended!-------------------"

    @gym_winner = winner
    @player.pokemon.prepare_for_battle
  end

  private

  def select_first(player_pokemon, bot_pokemon)
    player_move = player_pokemon.current_move
    bot_move = bot_pokemon.current_move

    return player_pokemon if player_move[:priority] > bot_move[:priority]
    return bot_pokemon if player_move[:priority] < bot_move[:priority]

    if player_pokemon.stats[:speed] > bot_pokemon.stats[:speed]
      player_pokemon
    elsif player_pokemon.stats[:speed] < bot_pokemon.stats[:speed]
      bot_pokemon
    else
      [player_pokemon, bot_pokemon].sample
    end
  end

  def print_lives_players
    puts "#{@player.name.capitalize}'s #{@player_pokemon.name.capitalize} - Level #{@player_pokemon.level}"
    @player_pokemon.stats[:hp].negative? ? (puts "HP: 0") : (puts "HP: #{@player_pokemon.stats[:hp]}")
    puts "#{@bot.name.capitalize}'s #{@bot_pokemon.name.capitalize} - Level #{@bot_pokemon.level}"
    @bot_pokemon.stats[:hp].negative? ? (puts "HP: 0") : (puts "HP: #{@bot_pokemon.stats[:hp]}")
  end

  def battle_loop
    until @player_pokemon.fainted? || @bot_pokemon.fainted?
      @player.select_move
      @bot.select_move

      first = select_first(@player_pokemon, @bot_pokemon)
      second = first == @player_pokemon ? @bot_pokemon : @player_pokemon
      print "\n"
      puts "--------------------------------------------------"
      first.attack(second)
      second.attack(first) unless second.fainted?
      puts "--------------------------------------------------"
      print_lives_players
    end
  end
end
