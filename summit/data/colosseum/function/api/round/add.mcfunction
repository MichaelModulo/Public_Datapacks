
#tag @s add summit_colosseum_join_round
#function colosseum:api/round/add {booth:"The Shulker Box"}

# get player names
data remove storage colosseum:temp players
scoreboard players set #players colosseum 0
execute as @a[tag=summit_colosseum_join_round] at @s run function colosseum:round/add/player
execute if score #players colosseum matches ..0 run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"No players were assigned to this round.","color":"red"}]
execute if score #players colosseum matches ..0 run return -1

# verify timeslot
$execute unless data storage colosseum:active timeslot{booth:"$(booth)"} run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"Wrong timeslot for this booth.","color":"red"}]
$execute unless data storage colosseum:active timeslot{booth:"$(booth)"} run return -2

# create entry
$data modify storage colosseum:temp round set value {booth:"$(booth)"}
data modify storage colosseum:temp round.players set from storage colosseum:temp players
execute store result storage colosseum:temp round.id int 1 run random value 1..2147483647

# add
data modify storage colosseum:active rounds append from storage colosseum:temp round

return run data get storage colosseum:temp round.id
