![https://cdn.apkmody.io/uploads/2020/09/Pokemon-Ruby-GBA-Rom-Download-720x360.jpg](https://cdn.apkmody.io/uploads/2020/09/Pokemon-Ruby-GBA-Rom-Download-720x360.jpg)

This project consists to build a very close recreation of the classic Pokemon
game. You will be able to select one pokemon at the beginning of the game. Then
you can train your pokemon in a battle with other random trainers. You will be
able to see your pokemon stats to check your progress. When you feel ready, you
will be able to challenge Gym Leader Brock. If you defeat Brock you won the game
💪🏼.

## HAPPY PATH

When you start the game, the program displays a welcome message and then asks
for your name.

```bash
$ ruby game.rb
#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#
#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
#$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#
#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#

Hello there! Welcome to the world of POKEMON! My name is OAK!
People call me the POKEMON PROF!

This world is inhabited by creatures called POKEMON! For some
people, POKEMON are pets. Others use them for fights. Myself...
I study POKEMON as a profession.
First, what is your name?
>
```

When you put your name, the program will print some text where it uses the name
you give it. Then the program prompts you to choose a pokemon between Bulbasaur,
Charmander, and Squirtle:

```bash
> Great Master
Right! So your name is GREAT MASTER!
Your very own POKEMON legend is about to unfold! A world of
dreams and adventures with POKEMON awaits! Let's go!
Here, GREAT MASTER! There are 3 POKEMON here! Haha!
When I was young, I was a serious POKEMON trainer.
In my old age, I have only 3 left, but you can have one! Choose!

1. Bulbasaur    2. Charmander   3. Squirtle     
>
```

When you select Charmander (for example), the program confirms your selection
displaying a message. Then it prompts you to give your pokemon a name
(optional). If you don't give any name, the name of the pokemon will be the
pokemon species (Charmander for example)

```bash
> Charmander

You selected CHARMANDER. Great choice!
Give your pokemon a name?
>
```

After you input a name (or nothing at all), the program will print a final
message using your name and your pokemon name. Finally, it will display the game
menu:

```bash
> Great Char
GREAT MASTER, raise your young GREAT CHAR by making it fight!
When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

If you input "Stats", the main statistics of your pokemon will be shown:

```bash
> Stats

Great Char:
Kind: Charmander
Level: 1
Type: fire
Stats:
HP: 12
Attack: 6
Defense: 6
Special Attack: 6
Special Defense: 6
Speed: 6
Experience Points: 0
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

If you type Train, the program will challenge a Random Person with a random
pokemon to a battle. The program displays the pokemon kind and level and asks
you to choose between Fight and Leave.

```bash
> Train

Great master challenge Random Person for training
Random Person has a Onix level 4
What do you want to do now?

1. Fight        2. Leave        
>
```

If you select Fight, the program will start a battle between you and Random
Person. It will display the hp of each pokemon and then prompt you to select a
move printing the available move for your pokemon.

```bash
> Fight

Random Person sent out ONIX!
Great master sent out GREAT CHAR!
-------------------Battle Start!-------------------

Great master's Great Char - Level 1
HP: 12
Random Person's Onix - Level 4
HP: 17

Great master, select your move:

1. scratch      2. ember        
>
```

If you select a valid move, the program will select a random move for the
opponent as well and process the result. The result includes the calculation of:

- Who attacks first?
- The attack move of the attacker hit the opponent?
- The attack inflicted a Critical Hit?
- The attack is effective? (could be super effective, not very effective, not
  effective at all or regular)
- How much damage will be inflicted?

After doing all the calculations, the program will print the result including
the new status for each pokemon.

```bash
> scratch

--------------------------------------------------
Great Char used SCRATCH!
It's not very effective...
And it hit Onix with 1 damage
--------------------------------------------------
Onix used ROCK THROW!
It's super effective!
And it hit Great Char with 6 damage
--------------------------------------------------
Great master's Great Char - Level 1
HP: 6
Random Person's Onix - Level 4
HP: 16

Great master, select your move:

1. scratch      2. ember        
>
```

If both of the pokemons are still alive the program prompt for a new move. The
battle continues until one of the pokemon faints (hp ≤ 0). If one pokemon faints
before making his move, the move won't be made at all. The program will print
who was the winner and print the menu again.

```bash
> scratch

--------------------------------------------------
Onix used ROCK THROW!
It was a CRITICAL hit!
It's super effective!
And it hit Great Char with 9 damage
--------------------------------------------------
Great Char FAINTED!
--------------------------------------------------
Onix WINS!
-------------------Battle Ended!-------------------
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

If you won a battle, the program will show the amount of experience points your
pokemon gained. Here is an example of a battle vs a Bulbasaur level 2:

```bash
> train

Great master challenge Random Person for training
Random Person has a Bulbasaur level 2
What do you want to do now?

1. Fight        2. Leave        
> fight

Random Person sent out BULBASAUR!
Great master sent out GREAT CHAR!
-------------------Battle Start!-------------------

Great master's Great Char - Level 1
HP: 12
Random Person's Bulbasaur - Level 2
HP: 13

Great master, select your move:

1. scratch      2. ember        
> ember  

--------------------------------------------------
Great Char used EMBER!
It's super effective!
And it hit Bulbasaur with 6 damage
--------------------------------------------------
Bulbasaur used VINE WHIP!
It's not very effective...
And it hit Great Char with 1 damage
--------------------------------------------------
Great master's Great Char - Level 1
HP: 11
Random Person's Bulbasaur - Level 2
HP: 7

Great master, select your move:

1. scratch      2. ember        
> ember

--------------------------------------------------
Bulbasaur used TACKLE!
And it hit Great Char with 3 damage
--------------------------------------------------
Great Char used EMBER!
It's super effective!
And it hit Bulbasaur with 6 damage
--------------------------------------------------
Great master's Great Char - Level 1
HP: 8
Random Person's Bulbasaur - Level 2
HP: 1

Great master, select your move:

1. scratch      2. ember        
> scratch

--------------------------------------------------
Bulbasaur used VINE WHIP!
It's not very effective...
And it hit Great Char with 1 damage
--------------------------------------------------
Great Char used SCRATCH!
And it hit Bulbasaur with 3 damage
--------------------------------------------------
Bulbasaur FAINTED!
--------------------------------------------------
Great Char WINS!
Great Char gained 18 experience points
-------------------Battle Ended!-------------------
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

If you check your stats you can confirm the experience points added:

```bash
> stats

Great Char:
Kind: Charmander
Level: 1
Type: fire
Stats:
HP: 12
Attack: 6
Defense: 6
Special Attack: 6
Special Defense: 6
Speed: 6
Experience Points: 18
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

When you gain enough experience points, you will level up and the program will
show you a message and recalculate your stats based on your new level.

```bash
> scratch

--------------------------------------------------
Charmander used SCRATCH!
And it hit Great Char with 4 damage
--------------------------------------------------
Great Char used SCRATCH!
And it hit Charmander with 4 damage
--------------------------------------------------
Charmander FAINTED!
--------------------------------------------------
Great Char WINS!
Great Char gained 35 experience points
Great Char reached level 5!
-------------------Battle Ended!-------------------
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

When you feel ready, you can challenge de Leader for a fight. If you win the
battle the game show you a congratulation message. In this example Great Char
has reached level 20 and can defeat Brock's Onix:

```bash
> Leader

Great master challenge the Gym Leader Brock for a fight!
Brock has a Onix level 10
What do you want to do now?

1. Fight        2. Leave        
> Fight

Brock sent out ONIX!
Great master sent out GREAT CHAR!
-------------------Battle Start!-------------------

Great master's Great Char - Level 20
HP: 51
Brock's Onix - Level 10
HP: 29

Great master, select your move:

1. scratch      2. ember        
> ember

--------------------------------------------------
Onix used TACKLE!
And it hit Great Char with 3 damage
--------------------------------------------------
Great Char used EMBER!
It's not very effective...
And it hit Onix with 5 damage
--------------------------------------------------
Great master's Great Char - Level 20
HP: 48
Brock's Onix - Level 10
HP: 24

Great master, select your move:

1. scratch      2. ember        
> ember

--------------------------------------------------
Great Char used EMBER!
It's not very effective...
And it hit Onix with 5 damage
--------------------------------------------------
Onix used TACKLE!
And it hit Great Char with 3 damage
--------------------------------------------------
Great master's Great Char - Level 20
HP: 45
Brock's Onix - Level 10
HP: 19

Great master, select your move:

1. scratch      2. ember        
> scratch

--------------------------------------------------
Onix used ROCK THROW!
It's super effective!
And it hit Great Char with 8 damage
--------------------------------------------------
Great Char used SCRATCH!
It's not very effective...
And it hit Onix with 6 damage
--------------------------------------------------
Great master's Great Char - Level 20
HP: 37
Brock's Onix - Level 10
HP: 13

Great master, select your move:

1. scratch      2. ember        
> ember

--------------------------------------------------
Great Char used EMBER!
It's not very effective...
And it hit Onix with 5 damage
--------------------------------------------------
Onix used TACKLE!
And it hit Great Char with 3 damage
--------------------------------------------------
Great master's Great Char - Level 20
HP: 34
Brock's Onix - Level 10
HP: 8

Great master, select your move:

1. scratch      2. ember        
> ember

--------------------------------------------------
Onix used ROCK THROW!
It's super effective!
And it hit Great Char with 8 damage
--------------------------------------------------
Great Char used EMBER!
It was a CRITICAL hit!
It's not very effective...
And it hit Onix with 7 damage
--------------------------------------------------
Great master's Great Char - Level 20
HP: 26
Brock's Onix - Level 10
HP: 1

Great master, select your move:

1. scratch      2. ember        
> scratch

--------------------------------------------------
Great Char used SCRATCH!
It's not very effective...
And it hit Onix with 6 damage
--------------------------------------------------
Onix FAINTED!
--------------------------------------------------
Great Char WINS!
Great Char gained 110 experience points
-------------------Battle Ended!-------------------
Congratulation! You have won the game!
You can continue training your Pokemon if you want
-----------------------Menu-----------------------

1. Stats        2. Train        3. Leader       4. Exit         
>
```

When you write Exit, the program print a goodbye message:

```bash
> Exit

Thanks for playing Pokemon Ruby
This game was created with love by: [your names]
```

# Game Mechanics

## Pokemon Battle

Pokémon battles are turn-based: they consist of repeated rounds or turns, each
of which requires both participants to choose an action (move) to take and then
resolves the outcome of those actions. The resolution does not depend on the
timing when the buttons are pressed or other input combinations; only your
choice of actions to take can help you towards victory.

The objective of Pokémon battling is to cause the opponent's Pokémon to faint by
reducing their hit points (HP) to zero. On each turn, both players choose the
action to take, and then the battle mechanics resolve the result including Who
attacks first? Does the attack hit the opponent? How much damage did the attack
inflict? Does the attack finalize the battle?

## Stats

All Pokémon have six statistics or stats: **Hit Points** (HP), **Attack**,
**Defense**, **Special Attack,** **Special Defense**, and **Speed**. They are a
function of your Pokémon's level and species, they are also affected by
Individual Values (or factors) that make no two Pokémon the same. To see how
exactly the stats are determined check **Stats Mechanics**.

- **Hit points (hp):** determines how much damage it can take before fainting. A
  pokemon start a battle with his maximum HP but it is his **Current HP** the
  one that represents its health during a battle. The health points lost during
  battle do not affect the original HP, just the current hp.
- **Attack/Defense/Special Attack/Special Defense:** These stats control how
  much damage is done when a move is used. Your Pokémon's Attack and Special
  Attack determine how much damage it does when it attacks with regular
  (physical) or special moves respectively, while its Defense and Special
  Defense determine how much damage it takes when it is attacked by a regular
  (physical) or special move respectively. These values are used on the **Damage
  Formula** calculation.
- **Speed**: This determines how fast your Pokémon is, which effectively means
  it controls the order in which the Pokémon in battle will move each turn.
  However, that this is not universal: the primary factor of move order is
  actually the **priority.** (check details on Move Order)

## Types and Type Effectiveness

Each Pokémon species has one or two out of eighteen types. Types are like
elements or essences that define what kinds of moves the Pokémon is susceptible
to and what kinds of moves it can shake off easily. The types in the Pokémon
games are Normal, Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground,
Flying, Psychic, Bug, Rock, Ghost, Dragon, Dark, Steel and Fairy. Each type is
weak to some types (which causes **moves of those types** to deal double damage
against Pokémon of this type), resistant to other types (whose **moves** will
deal half damage against Pokémon of this type), and immune to yet other types
(meaning **moves of those types** will deal no damage to Pokémon of this type at
all), with those leftover dealing normal damage against it. This is summarized
in the following table:

![Effectiveness Table](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/5aff39c6-1db4-4d6c-bb98-e65ef3b0819d/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20211125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211125T213507Z&X-Amz-Expires=86400&X-Amz-Signature=750f94da2076bf8bf8677c2ce19d9170a80a441a710bbe5de261eb12f5297bd3&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22&x-id=GetObject)

If a Pokémon has two types, the damage from a given type of attack will be
multiplied for both factors, so that for instance, if you use a **Fire move**
against a **Water/Grass-type**, the damage will be halved because Water is
resistant to Fire but then doubled because Grass is weak to Fire - the end
result is normal, neutral damage.

## Moves

### Move Category

The **regular**(physical) or **special** classification of the move is what
determines whether the Damage Formula plugs in the user's Attack and the
target's Defense or the user's Special Attack and the target's Special Defense.

A move is classified as special if its type is one of the following: Fire,
Water, Electric, Grass, Ice, Psychic, Dragon, or Dark. Every other move is
classified as regular (physical)

### Move Base Power

This number represents how powerful a damaging move is.

### Target

In this game, the target of the move will be always the opponent pokemon (status
or healing moves are not considered)

### Accuracy

A move has a chance to miss and had no effect at all on the target. Accuracy is
a number from 1 to 100 representing the percentage chance of hitting the target.

### Priority

Every move has a priority level, which is the primary factor of the order in
which the Pokémon execute their moves each turn. Moves with a higher priority
are always executed before moves with a lower priority

## Experience Points

Any level 1 pokemon starts with 0 experience points. To level up, the pokemon
needs to gain experience points. The only way to gain experience points is by
winning battles.

Each pokemon has a base experience that depends entirely on their species. For
example, Charmander has a base experience of 62. The amount of experience you
gain when defeating an opponent depends on the base experience and level of the
opponent pokemon. The formula is:

`(base_experience * level / 7.0).floor`

If you win a battle vs a Charmander level 5 your pokemon will gain:

`(62 * 5 / 7.0).floor = 44` You would gain 44 experience points. 

## Effort Values and Effort Points

Each pokemon has an effort value associated with each of his stats (one effort
value for hp, another for the attack, and so on). When created, a new pokemon
starts with 0 effort value on all its stats. This effort value plays a role when
the pokemon stats are calculated. The higher the effort value, the higher the
stat. So, how the effort values are incremented? Well, winning pokemon battles.

Each pokemon has an effort points property. This represents the number of effort
points you will gain if you defeat that pokemon in a battle. The effort point
has the form: `type: amount`. For example, Bulbasaur has `special attack: 1`.
Meaning that if you defeat Bulbasaur in a battle, you will gain 1 effort point
on your special attack stat. Charmander has `speed: 1`, so if you defeat
Charmander in a battle you will gain 1 effort point on your speed stat.

To see how the effort values affect the overall pokemon stats, check the section
**Stats Mechanics**.

## Battle Mechanics

### Turn order

After each player has chosen a move, the execution order is determined by:

- The move with higher priority goes first.
- The pokemon with greater speed goes first
- Random order.

### Accuracy Check

Apply the accuracy number of the move. A move with 85 of accuracy has an 85%
chance of hitting the target.

### Critical Hit Ratio

For this exercise, every move has a 1/16 chance of being a critical hit. A
critical hit deals 1.5 times the damage it normally would.

### Damage Formula Calculation

The base damage is calculated as follow:

`(((2 * level / 5.0 + 2).floor * offensive_stat * move_power / target_defensive_stat).floor / 50.0).floor + 2`

- **level**: the user (attacker) pokemon level.
- **offensive_stat**: If the move has a special category this value is the
  user's **special attack stat.** Otherwise, this value is the user **attack
  stat.**
- **move_power**: Is the move base power
- **target_defensive_stat**: If the movie has a special category then this value
  is the **target** **special defense stat.** Otherwise, this value is the
  **target** **defense stat.**

The base damage is multiplied by 1.5 if the move has a critical hit. Finally,
the result is multiplied by the Type Effectiveness. The final result is rounded
down (floor).

## Stats Mechanics

This section explain how the pokemon stats are calculated. The formula is the following:

For the HP stat:

`stat = ((2 * base_stat + stat_individual_value + stat_effort) * level / 100 + level + 10).floor`

For the rest of stats (attack, special attack, defense, special defense and speed)

`stat = ((2 * base_stat + stat_individual_values + stat_effort) * level / 100 + 5).floor`

The details of both formula are:

- **base_stat**: This is the base value of the stat. The base value is a given
  value and is set when the pokemon is created and never changes.
- **stat_individual_value**: This is a random number between 0 and 31. The
  individual value for each stat is randomly set when the pokemon is created and
  never changes.
- **stat_effort**: This value is calculated based on the effort value of each
  stat. Each stat starts with an effort value of 0 and is increased over time
  when your pokemon win battles. The stat_effort is calculated in this way:
  `(stat_effort_value / 4.0).floor`
- **level:** the current pokemon level

For example, a just created Charmander **could** have the following stats
(emphasis on could for the random chance for the individual values)

From the Pokedex:

- **base stats: { hp: 39, attack: 52, defense: 43, special_attack: 60, special_defense: 50, speed: 65 }**

When initialized:

- **level: 1**
- **individual values:  {hp: 3, attack: 18, defense: 23, special_attack: 1, special_defense: 15, speed: 10 }**
- **effort values: {hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }**
- **stats: ??????????**

Let's calculated the stats for HP:

`hp = ((2 * 39 + 3 + 0) * 1 / 100 + 1 + 10).floor`

`hp = 11`

And for any other stat like attack:

`attack = ((2 * 52 + 18 + 0) * 1 / 100 + 5).floor`

`attack = 6`

If we calculate the rest of stats the result will be:

- **stats: {hp: 11, attack: 6, defense: 6, special_attack: 6, special_defense: 6, speed: 6 }**

A lot of 6s... well, which different individual values the result could be
different. Another thing to take into consideration is that all the
`stat_effort` has been 0's. With training, our pokemon will gain effort points
that will increase the effort value and finally increase the stat_effort (
`stat_effort = (stat_effort_value / 4.0).floor`)

## Level Mechanics

The level of the pokemon affects directly all the other stats. Each pokemon
needs a certain amount of experience points to reach and increase his level. A
pokemon created with level 1 has 0 experience points. Each pokemon species has a
specific `growth_rate` that could be `slow`, `medium_slow`, `medium_fast`, or
`fast`.

Each growth rate has a different formula to calculate how many experience points
the pokemon needs to reach a certain level. The formulas are:

![slow growth rate](https://wikimedia.org/api/rest_v1/media/math/render/svg/3c84db75e33b927e9a33c527db921cc939f59a2f)

slow growth rate

![medium_slow growth rate](https://wikimedia.org/api/rest_v1/media/math/render/svg/9678c538b685da094f4a023a09a1d09534ed4362)

medium_slow growth rate

![medium_fast growth rate](https://wikimedia.org/api/rest_v1/media/math/render/svg/699b8bed541837f5062dc25f1de14f04d7cdaa99)

medium_fast growth rate

![fast growth rate](https://wikimedia.org/api/rest_v1/media/math/render/svg/dceb8ae6b45c5e669a115f0d1f875dba72a3f093)

fast growth rate

Where `EXP` is the minimum amount of experience points to reach level `n`

For example, Charmander has a medium_slow growth rate, so for reach the level 3
would require:

`exp = (6 / 5.0 * 3**3 - 15 * 3**2 + 100 * 3 -140).floor`

`exp =  57`

When Charmander reaches 57 experience points it will obtain Level 3. Every time
your pokemon gain experience, don't forget to check if he has reached a new
level 🙂

# About the program

While you and your team are free to structure the code as you like, we have some
recommendations :

## Pokedex Module

The Pokedex module store all the immutable information about the game (pokemon
properties by species, pokemon move, level tables, and more). You will find a
`pokedex.rb` file with some structure.

## Pokemon Class

Here are some suggestions about the pokemon class, their properties, value
types, and some methods:

A `Pokemon` in general has the following properties:

- species: a string with the pokemon species. Example: `"Charmander"`
- type: an array of symbols with the pokemon types or type. Example:
  `[:grass, :poison]`
- base_exp: an integer with the base experience of the pokemon 'base
  experience'. Example: `60`
- growth_rate: a symbol representing the growth rate velocity of the pokemon. It
  could be :slow, :medium_slow, :medium_fast, :fast. Example: `:medium_slow`
- base_stats: a hash with the number of each base stat of the pokemon. Example:
  `{ hp: 45, attack: 49, defense: 49, special_attack: 65, special_defense: 65, speed: 45 }`
- effort_points: a hash containing the type of stat and the amount of points.
  Example: `{ type: :special_attack, amount: 1 }`
- moves: an array of strings with the moves the pokemon can perform. Example
  `["tackle", "vine whip"]`

All this variables comes from the Pokedex module.

When a `Pokemon` is created, in addition to the previous variables, it will have
as well:

- name A name given by the user. If no name is given, the name should be the
  pokemon species. Example: `"Colita"`
- level: A number given by the developer on creation. if no level is given the
  level is set to 1. This number represents the current level of the Pokemon.
  Example: `1`
- individual_stats: a hash with a random generated number between 0 and 31 for
  each of the pokemon stat. Example:
  `{ hp: 3, attack: 6, defense: 18, special_attack: 0, special_defense: 23, speed: 18 }`
- effort_values: a hash with a number for each base stat of the pokemon that
  represents the number of effort points that the pokemon has gained during the
  training. All the effort points start with 0. Example:
  `{ hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }`
- experience_points: A number representing the number of experience points
  gained by the pokemon through training. The initial value for this variable
  depends on the level of the pokemon on creation. If the level is 1, the
  experience points start with 0. If the level is greater than 1, the experience
  points are set to the minimum amount of experience points for that level. This
  minimum amount is obtained from the level tables of the Pokedex module.
- stats: a hash with the calculated number for each stat of the pokemon. For the
  calculation, a formula is used (look at how to calculate pokemon stats).
  Example:
  `{ hp: 20, attack: 11, defense: 12, special_attack: 15, special_defense: 15, speed: 20 }`

You can ask a `Pokemon` to:

- Prepare for battle: setting the necessary variables to be ready to start
  fighting.
- Receive damage: to reduce its current hp accordingly
- Set a current move: to be used in the current battle turn
- Is fainted?: to know if his current hp is below zero
- Attack: using its current move it attacks a target, make all the necessary
  calculations and inflect damage to the target (calling their receive_damage
  method)
- Increase stats: To add experience points and effort points when winning a
  battle.

## Battle Class

A `Battle` needs 2 `Players` to work consistently. Additionally, it could track
who is winning the battle.

You can ask a `Battle` to:

- Prepare a battle: Take the two pokemon players and prepare them for the
  battle.
- Start a battle: This could include a call to the preparation action, the order
  calculation, and the loop where both pokemon fight each other. The battle
  should keep track of one of the pokemon faints to end the battle
  appropriately.

## Player Class

When a `Player` is created, it is given a name and a pokemon (only the species
name). Optionally a pokemon name and a pokemon level. If the pokemon level is
not given, the pokemon will be level 1. The `Player` class then creates a new
pokemon using the Pokemon class and the information given.

You can ask a `Player` to:

- Select a move: Ask the user for a move and use this information to set the
  move on his pokemon.

## Bot Class

A `Bot` is a special kind of Player. The only difference is that, when asked to
select a move, it does it randomly instead of asking the user for input.

## Game Class

The `Game` class controls the main flow of the program. It can relay exclusively
on methods.

You can ask a `Game` to:

- Start a game: Display the welcome message, gather information to create a
  `Player` and his `Pokemon`, and display the main menu. Then it controls the
  user input to call the other actions like `train`, `show_stats`,
  `challenge_leader`, or `exit`.
- Start a training: when the user selects that option it creates a random
  opponent, shows the information about the possible battle to the user, and
  asks him to decide between fight or leave. If the user select fight its start
  a new `Battle`
- Start a leader challenge: Similar to the training but with a specific
  opponent: Brock with a Level 10 Onix! When the battle finishes, it should
  check if the `Player` wins in order to display the congratulation message.
- Show stats: Display the current stats of the Player's Pokemon.
- Say goodbye: The last message before leaving the game.
