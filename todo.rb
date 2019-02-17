X Define log parser 
- Define rules parser (game start/end) > module
- Define game model
- Parse each game*
- Define kill rules**
- Define models (player, kill) > Generate a report of deaths grouping by death cause, per game.



------------
*
### Observation

The project should be capable to read the file, group the game data of each game and then collect dead score.

For each game generate something like:

game_1: {
    total_kills: 45;
    players: ["Dono da bola", "Isgalamido", "Zeh"]
    kills: {
      "Dono da bola": 5,
      "Isgalamido": 18,
      "Zeh": 20
    }
  }

**
1. When `<world>` kill the player, the player lose -1 kill score.
2. `<world>` is not a player and should not appear in the list of players and even the kills in the dictionary.
3. `total_kills` are the kills of games, this includes deaths of `<world>`.


