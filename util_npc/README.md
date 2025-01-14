# NPC Util
Makes it easier to implement NPC's and the systems needed for their operation. This includes dialogue, attacking, events, quests, trading, etc.

# NPC Setup

To spawn an NPC you must fill out the information below and store it into the following storage location:<br>
`data modify storage util_npc:setup npc.<path>`

After this is done you can run the following function to spawn the NPC:<br>
`function util_npc:npc/creation/spawn`


## Core Data

The nbt below is used to setup important elements that identify the NPC:<br>
Storage: `util_npc:setup npc.<path>`

|Note|Path       |Value          |Description|
|-   |-           |-              |-|
R    |`id`        |`<string>`     |Unique identifier for saving and loading.
R    |`tag`       |`<string>`     |Unique tag for selector checks.
R    |`name`      |`<json>`       |Name displayed in dialogue.


## Config Data

The nbt below contains additional config settings:<br>
Storage: `util_npc:setup npc.config.<path>`

|Note|Path                        |Value          |Description|
|-   |-                            |-              |-|
O    |`look_at_player`             |`<bool>`       |The NPC will look at the nearest player occasionally.
O    |`attack_angry_particles`     |`<bool>`       |The NPC will display angry villager particles when attacked.
O    |`auto_death_respawn`         |`<bool>`       |The NPC will automatically respawn shortly after dying.
O    |`conversions[].type`         |`<string>`     |Mob id to check for.
O    |`conversions[].function`     |`<string>`     |Funciton to run for conversion.


## Entity Data

The nbt below is used to spawn the physical entities that represent the NPC:<br>
Storage: `util_npc:setup npc.<path>`

|Note|Path                 |Value           |Description|
|-   |-                     |-               |-|
R    |`entity.type`         |`<string>`      |The id of the minecraft entity. <br>(`util_npc:none` for no entity)
R    |`entity.data`         |`<json>`        |The data to store on the entity.
R    |`interaction.data`    |`<json>`        |The data to store on the interaction entity.
O    |`interaction.trading` |`<json>`        |[requires &nbsp;`type: "minecraft:villager"`]<br>Alternative data used if the villager has active trades.


## Conversation Data

The nbt below should be grouped together and appeneded to the following storage location:<br>
Storage: `util_npc:setup npc.conversations[{<path>}]`

### General

|Note|Path                        |Value                                                |Description|
|-   |-                           |-                                                    |-|
R    |`type`                      |`group`, `chat`, `attack`, `event`                   |The type of dialogue that is contained.
~D   |`ids`                       |[<string>]                                           |[requires &nbsp;`type: "group"`]<br>An array of ids for conversations that need to be unpacked.<br>(if used, do not use any other data below)
~D   |`event`                     |`<string>`                                           |[requires &nbsp;`type: "event"`]<br>The event that must be activated.
R    |`id`                        |`<string>`                                           |Unique identifier used for saving and loading.
R    |`save`                      |`player`, `npc`                                      |[overiddes to `npc` if `type: "event"`]<br>Should the progress be tied to the player or npc.
R    |`mode`                      |`linear`, `looping`, `random`, `first_valid`         |Determines how a conversations dialogue is used.<br>`linear`: Will progress through the conversation in order until it is completed.<br>`looping`: Similar to linear but will reset progress once it reaches the end.<br>`random`: A random line of dialogue will be chosen each time.<br>`first_valid`: Will go through the dialogue and choose the first valid option.
~R   |`order`                     |`queue`, `random`                                    |Determines whether the conversation should be queued or selected at random.<br>(`queue` is processed first)
~~R  |`priority`                  |`low`, `medium`, `high`                              |[requires &nbsp;`order: "queue"`]<br>Determines the order of queued dialogue
O    |`counter`                   |`<bool>`                                             |Will display a counter next to dialogue, indicating progress in the conversation. <br>(changes visuals depending on `mode`)
O    |`icon`                      |`<json>`                                             |Used to paste an icon before each icon to better differentiate the conversations purpose.
O    |`broadcast`                 |`<bool>`                                             |[overrides to `false` if `type: "event"`]<br>Will display dialogue to other nearby players.
O    |`header.top`                |`<json>`                                             |Header text display above the first line in conversation.
O    |`header.bottom`             |`<json>`                                             |Header text display below the last line in conversation.
O    |`continuation.source`       |`loaded`, `ungrouped`,`valid`, `reserve`, `all`      |[disabled if `mode: "random"`]<br>The location where a conversation will be searched for.<br>(not recommended with `save: "npc"`)
~O   |`continuation.forward`      |`<string>`                                           |A conversation id that will be continued immediately after current conversation is finished.
~O   |`continuation.looping`      |`<bool>`                                             |[requires &nbsp;`mode: "looping"`]<br>Will contiune conversation even after completion.<br>(will only be exited if expired or source does not contain conversation)
~O   |`continuation.expiration`   |`<int>`                                              |The number of ticks after which the conversation will expire and exit.
~~O  |`continuation.exit`         |`<bool>`                                             |Will exit the conversation when it expires.
~~O  |`continuation.reset`        |`<bool>`                                             |Will reset the progress of the conversation when expired.
R    |`dialogue`                  |{`<dialogue>`}                                       |Refer to "Dialogue" section.
O    |`conditions`                |{`<conditions>`}                                     |Refer to "Conditions" section.

### Dialogue

|Note|Path                        |Value                                 |Description|
|-   |-                           |-                                     |-|
O    |`loot`                      |`<string>`                            |The loot table that is granted.
O    |`run_command`               |`<string>`                            |Run a command.
O    |`refresh_trades`            |`<bool>`                       |Refreshes the trades.
O    |`delay`                     |`<int>`                               |The number of tick until the player can interact with NPC.
R    |`lines`                     |[{`<line>`}]                          |Refer to "Dialogue (Line)" section.
O    |`conditions`                |{`<conditions>`}                      |Refer to "Conditions" section.

### Dialogue (Line)

|Note|Path                        |Value                          |Description|
|-   |-                           |-                              |-|
R    |`message`                   |`<json>`                       |The message that is displayed.
O    |`icon`                      |`<json>`                       |Used to paste an icon before each icon to better differentiate the conversations purpose.
O    |`counter`                   |`<bool>`                       |Will enable the counter for this line.
O    |`name`                      |`<json/false>`                 |Will either override the name displayed or remove it.
O    |`audio.type`                |`<string>`                     |The sound that is played.
~R   |`audio.volume`              |`<float>`                      |The volume of the audio.
~R   |`audio.pitch`               |`<float> (0.0 to 2.0)`         |The pitch of the audio.
~O   |`audio.selector`            |`<string>`                     |The entity that the sound is played at.
~O   |`audio.location`            |`<string>`                     |The location that the sound is played at.
O    |`conditions`                |{`<conditions>`}               |Refer to "Conditions" section.
O    |`loot`                      |`<string>`                     |The loot table that is granted.
O    |`run_command`               |`<string>`                     |Run a command.
O    |`refresh_trades`            |`<bool>`                       |Refreshes the trades.
O    |`set_memory[].save`         |`player`, `npc`                |Where to set memory.
~R   |`set_memory[].path`         |`<string>`                     |Path to memory.<br>(it is recommended to prefix with a namespace)
~R   |`set_memory[].value`        |`<string>`                     |Value to store in memory.
~O   |`set_memory[].keep`         |`<bool>`                       |WIll not set memory if that path already has a value.
~O   |`set_memory[].append`       |`<bool>`                       |Will append instead of setting the value.

### Trades

|Note|Path                        |Value                                                |Description|
|-   |-                           |-                                                    |-|
R    |`type`                      |`group`, `chat`, `attack`, `event`                   |The type of trade that is contained.
~D   |`ids`                       |[<string>]                                           |[requires &nbsp;`type: "group"`]<br>An array of ids for trades that need to be unpacked.<br>(if used, do not use any other data below)
R    |`id`                        |`<string>`                                           |Unique identifier used for saving and loading.
R    |`method`                    |`direct`, `lib_trades`                               |The trade mode that is used.
~D   |`trade`                     |`<json>`                                             |[requires &nbsp;`method: "direct"`]<br>The json data of a trade "Recipe".<br>(if used, do not use any other data below)
~R   |`trade.loot_table`          |`<string>`                                           |The loot table used to set trade items.
~R   |`trade.trade_data.pool`     |`<string>`                                           |[because of bug `MC-174435`, avoid using duplicate pools]<br>The pool used by `lib_trades`.
~R   |`trade.trade_data.options`  |`<json>`                                             |General trade data that is used in the "Offer" root.
~O   |`trade.register`            |`<bool>`                                             |Registers all trades up to this point.<br>(used to ensure order of trades)<br>(only use on the last trade of any set with duplicate pools)


### Conditions

|Note|Path                       |Value                    |Description|
|-  |-                           |-                        |-|
O   |`time.range.min`            |`<int>`                  |The miniumum time.
~R  |`time.range.max`            |`<max>`                  |The maximum time.
~O  |`time.range.inverse`        |`<bool>`                 |Inverts the output.
O   |`time.day`                  |`<bool>`                 |Active from 1 to 12000.
O   |`time.night`                |`<bool>`                 |Active from 10001 to 24000.
O   |`time.morning`              |`<bool>`                 |Active from 1 to 6000.
O   |`time.midday`               |`<bool>`                 |Active from 6001 to 12000.
O   |`time.noon`                 |`<bool>`                 |Active from 12001 to 18000.
O   |`time.midnight`             |`<bool>`                 |Active from 18001 to 24000.
O   |`weather.raining`           |`<bool>`                 |Active when raining.
O   |`weather.thundering`        |`<bool>`                 |Active when thundering.
O   |`week.length`               |`<int>`                  |The length of a week.
~R  |`week.offset`               |`<int>`                  |An offset for the start of the week.
~R  |`week.day`                  |`<int>`                  |The day of the week.
~O  |`week.inverse`              |`<bool>`                 |Inverts the output.
O   |`random.chance`             |`<int> (0-100)`          |The chance of success.
O   |`random.inverse`            |`<bool>`                 |Inverts the output.
O   |`if.statement`              |`<string>`               |An entire if statement.
O   |`memory[].save`             |`player`, `npc`          |[overrides to `npc` if `type: "event"`]<br>Where to check memory.<br>(uses an array to offer multiple checks)
~R  |`memory[].path`             |`<string>`               |Path and value to check in the memory.
~O  |`memory[].npc`              |`<string>`               |Id of the npc.<br>(defaults to current npc)
~O  |`memory[].inverse`          |`<bool>`                 |Inverts the output.

## Events

The list below displays the different events available by default.<br>

|Category   |Event                                      |Activation|
|-          |-                                          |-|
|Time       |`util_npc:event/time/noon`                 |Activates shortly after 6000.
|Time       |`util_npc:event/time/sunset`               |Activates shortly after 12500.
|Time       |`util_npc:event/time/midnight`             |Activates shortly after 18000.
|Time       |`util_npc:event/time/sunrise`              |Activates shortly after 23000.
|Villager   |`util_npc:event/time/awake`                |Activates shortly after 0.
|Villager   |`util_npc:event/time/work_start`           |Activates shortly after 2000.
|Villager   |`util_npc:event/time/work_end`             |Activates shortly after 9000.
|Villager   |`util_npc:event/time/sleep`                |Activates shortly after 12000.
|Weather    |`util_npc:event/weather/clear`             |Activates when it becomes clear.
|Weather    |`util_npc:event/weather/raining`           |Activates when it begins to rain.
|Weather    |`util_npc:event/weather/thundering`        |Activates when it begins to thunder.
|Weather    |`util_npc:event/weather/thundering_clear`  |Activates when it stops thundering.
