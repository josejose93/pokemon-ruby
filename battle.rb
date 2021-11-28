require_relative "player"

class Battle
  attr_reader :gym_winner

  # (complete parameters)

  def initialize(player, bot)
    # Complete this
    @player = player
    @bot = bot
    @player_pokemon = @player.pokemon
    @bot_pokemon = @bot.pokemon
    @gym_winner = nil
  end

  def start
    # Prepare the Battle (print messages and prepare pokemons)
    puts "#{@bot.name} sent out #{@bot.pokemon.name}!"
    puts "#{@player.name} sent out #{@player.pokemon.name}!"
    puts "-------------------Battle Start!-------------------"

    # Until one pokemon faints
    # --Print Battle Status
    # --Both players select their moves
    battle_loop

    # --Calculate which go first and which second

    # --First attack second
    # --If second is fainted, print fainted message
    # --If second not fainted, second attack first
    # --If first is fainted, print fainted message

    # Check which player won and print messages
    winner = @player_pokemon.fainted? ? @bot_pokemon : @player_pokemon
    losser = winner == @player_pokemon ? @bot_pokemon : @player_pokemon

    # If the winner is the Player increase pokemon stats
    (winner == @player_pokemon) && winner.increase_stats(losser)
    puts "#{winner.name} WINS! They experience reached #{winner.experience_points}"
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

  def battle_loop
    # @player_pokemon.prepare_for_battle
    # @bot_pokemon.prepare_for_battle

    until @player_pokemon.fainted? || @bot_pokemon.fainted?
      @player.select_move
      @bot.select_move

      first = select_first(@player_pokemon, @bot_pokemon)
      second = first == @player_pokemon ? @bot_pokemon : @player_pokemon
      puts "--------------------"
      first.attack(second)
      second.attack(first) unless second.fainted?
      puts "--------------------"
    end
  end
end
