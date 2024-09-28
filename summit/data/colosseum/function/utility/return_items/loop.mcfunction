
execute store result score #slot colosseum run data get storage colosseum:process items[0].Slot
data modify storage colosseum:process items[0].Slot set value 0b

# create entry
data remove storage colosseum:process entry
data modify storage colosseum:process entry set from storage colosseum:process items[0]
execute store result storage colosseum:process entry.i int 1 run scoreboard players get #slot colosseum
data modify storage colosseum:process new_items append from storage colosseum:process entry

data remove storage colosseum:process items[0]
execute if data storage colosseum:process items[0] run function colosseum:utility/return_items/loop
