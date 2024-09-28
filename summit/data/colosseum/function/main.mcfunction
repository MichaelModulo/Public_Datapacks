
schedule function colosseum:main 1s

function colosseum:timeslot/process

execute if data storage colosseum:active timeslot{mode:"round_based"} run function colosseum:round/process

execute if score #timeslots colosseum matches 1 run scoreboard players set $time_left colosseum 180
function colosseum:display/update

execute as @a[tag=summit_colosseum_player,scores={colesseum.death=1..}] at @s run function colosseum:player/leave
execute as @a[tag=summit_colosseum_player,scores={colesseum.leave=1..}] at @s run function colosseum:player/leave

execute positioned -138 64 -18 as @a[tag=summit_colosseum_player,distance=..3] at @s if block ~ ~-1 ~ minecraft:black_concrete run function colosseum:player/leave
execute positioned -167 64 -47 as @a[tag=summit_colosseum_player,distance=..3] at @s if block ~ ~-1 ~ minecraft:black_concrete run function colosseum:player/leave

scoreboard players enable @a colosseum.tp_booth
execute as @a if score @s colosseum.tp_booth matches 892734503 run function colosseum:utility/tp_current_booth/attempt
