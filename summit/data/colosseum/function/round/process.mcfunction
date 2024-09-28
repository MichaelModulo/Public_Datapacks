
scoreboard players set $players colosseum 0
execute as @a[tag=summit_colosseum_player] run scoreboard players add $players colosseum 1

execute if score $players colosseum matches 1 run function colosseum:round/end

execute if score $players colosseum matches ..0 run function colosseum:round/next
