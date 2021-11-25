module Pokedex
  POKEMONS = {
    "Bulbasaur" => {
      species: "Bulbasaur",
      type: %i[grass poison],
      base_exp: 64,
      effort_points: { type: :special_attack, amount: 1 },
      growth_rate: :medium_slow,
      base_stats: { hp: 45, attack: 49, defense: 49, special_attack: 65, special_defense: 65, speed: 45 },
      moves: ["tackle", "vine whip"]
    },
    "Charmander" => {
      species: "Charmander",
      type: %i[fire],
      base_exp: 62,
      effort_points: { type: :speed, amount: 1 },
      growth_rate: :medium_slow,
      base_stats: { hp: 39, attack: 52, defense: 43, special_attack: 60, special_defense: 50, speed: 65 },
      moves: ["scratch", "ember"]
    },
    "Squirtle" => {
      species: "Squirtle",
      type: %i[water],
      base_exp: 63,
      effort_points: { type: :defense, amount: 1 },
      growth_rate: :medium_slow,
      base_stats: { hp: 44, attack: 48, defense: 65, special_attack: 50, special_defense: 64, speed: 43 },
      moves: ["tackle", "bubble"]
    },
    "Ratata" => {
      species: "Ratata",
      type: %i[normal],
      base_exp: 51,
      effort_points: { type: :speed, amount: 1 },
      growth_rate: :medium_fast,
      base_stats: { hp: 30, attack: 56, defense: 35, special_attack: 25, special_defense: 35, speed: 72 },
      moves: ["tackle", "quick attack"]
    },
    "Spearow" => {
      species: "Spearow",
      type: %i[normal flying],
      base_exp: 52,
      effort_points: { type: :speed, amount: 1 },
      growth_rate: :medium_fast,
      base_stats: { hp: 40, attack: 60, defense: 30, special_attack: 31, special_defense: 31, speed: 70 },
      moves: ["peck", "persuit"]
    },
    "Pikachu" => {
      species: "Pikachu",
      type: %i[electric],
      base_exp: 112,
      effort_points: { type: :speed, amount: 2 },
      growth_rate: :medium_fast,
      base_stats: { hp: 35, attack: 55, defense: 40, special_attack: 50, special_defense: 50, speed: 90 },
      moves: ["thunder shock", "quick attack"]
    },
    "Onix" => {
      species: "Onix",
      type: %i[rock ground],
      base_exp: 77,
      effort_points: { type: :defense, amount: 1 },
      growth_rate: :medium_fast,
      base_stats: { hp: 35, attack: 45, defense: 160, special_attack: 30, special_defense: 45, speed: 70 },
      moves: ["tackle", "rock throw"]
    }
  }.freeze

  # We used this constant to store all the required experience for each level on each growth rate.
  # You can use it or create your own methods to do it
  # LEVEL_TABLES = {
  #   slow: (1..100).map { |level| ((5 * level**3) / 4.0).floor },
  #   medium_slow: (1..100).map { |level| (6 / 5.0 * level**3 - 15 * level**2 + 100 * level - 140).floor },
  #   medium_fast: (1..100).map { |level| (level**3).floor },
  #   fast: (1..100).map { |level| (4 * level**3 / 5.0).floor }
  # }.freeze
end
