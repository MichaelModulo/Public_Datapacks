
# Misc Information

- The storage entry `colosseum:active timeslot` contains data about the current time slot.
- The storage entry `colosseum:active round` contains data about the current round.
- Players that are in a game have the tag: `summit_colosseum_player`
- A 10 minute `free_for_all` game is already in the timeslot queue.


# Function Tags

| Function Tag                 | Description                              |
| ---------------------------- | ---------------------------------------- |
| colosseum:api/game/start     | Activates when a game begins.            |
| colosseum:api/game/end       | Activates when a game ends.              |
| colosseum:api/timeslot/start | Activates when a timeslot begins.        |
| colosseum:api/timeslot/end   | Activates when a timeslot ends.          |
| colosseum:api/player/join    | Activates as a joining colosseum player. |
| colosseum:api/player/leave   | Activates as a leaving colosseum player. |

# Functions

### Register Timeslot
Registers a timeslot in the colosseum where only your booth can use it.
- `/function colosseum:api/timeslot/register {booth:"The Shulker Box",time:10,position:[-110d,88d,-98d],rotation:[0.0f,0.0f],mode:"round_based"}`

| Macro    | Type                        | Description                                    |
| -------- | --------------------------- | ---------------------------------------------- |
| booth    | \<string>                   | ID of your booth.                              |
| display  | \<json>                     | Display name for your booth.                   |
| time     | \<int>                      | Seconds your timeslot will last.<br>[max: 600] |
| position | \<position>                 | Position to return player after game.          |
| rotation | \<rotation>                 | Rotation to return player after game.          |
| mode     | free_for_all<br>round_based | Determines how the timeslot will be used.      |


### Deregister Timeslot
Deregisters a timeslot.
- `/function colosseum:api/timeslot/deregister {booth:"The Shulker Box"}`

| Macro | Type      | Description                    |
| ----- | --------- | ------------------------------ |
| booth | \<string> | Display name of your booth/id. |

| Return Value | Reason                             |
| ------------ | ---------------------------------- |
| -1           | Timeslot for booth does not exist. |

### End Timeslot
End a timeslot early.
- `/function colosseum:api/timeslot/end_early {booth:"The Shulker Box"}`

| Macro | Type      | Description                    |
| ----- | --------- | ------------------------------ |
| booth | \<string> | Display name of your booth/id. |

| Return Value | Reason                         |
| ------------ | ------------------------------ |
| -1           | Wrong timeslot for this booth. |


### Add Round
Adds a round to the current timeslot.
- Requires timeslot to have mode: `round_based`
- Add this tag to players that should join the round: `summit_colosseum_join_round`
- `/function colosseum:api/round/add {booth:"The Shulker Box"}`

| Macro | Type      | Description                    |
| ----- | --------- | ------------------------------ |
| booth | \<string> | Display name of your booth/ID. |

| Return Value  | Reason                                  |
| ------------- | --------------------------------------- |
| 1..2147483647 | ID of the round created.                |
| -1            | No players were assigned to this round. |
| -2            | Wrong timeslot for this booth.          |


### Remove Round
Removes a round from the current timeslot.
- Requires timeslot to have mode: `round_based`
- `/function colosseum:api/round/remove {id:1234567}`

| Macro | Type   | Description                |
| ----- | ------ | -------------------------- |
| id    | \<int> | ID of the round to remove. |

| Return Value | Reason                           |
| ------------ | -------------------------------- |
| -1           | No round with that ID was found. |


### Join Game
Puts a player into the colosseum. 
- Requires timeslot to have mode: `free_for_all`
- As player `function colosseum:api/round/join {booth:"The Shulker Box"}`

| Macro | Type      | Description                    |
| ----- | --------- | ------------------------------ |
| booth | \<string> | Display name of your booth/ID. |

| Return Value | Reason                                          |
| ------------ | ----------------------------------------------- |
| -1           | Free for all is not enabled, no direct joining. |
| -2           | Wrong timeslot for this booth.                  |

