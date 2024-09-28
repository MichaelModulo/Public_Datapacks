
#function colosseum:api/timeslot/register {booth:"The Shulker Box",time:10,position:[-110d,88d,-98d],rotation:[0.0f,0.0f],mode:"round_based"}

# verify
$execute unless data storage colosseum:registry timeslots[{booth:"$(booth)"}] run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"$(booth) timeslot has been registered.","color":"green"}]
$execute if data storage colosseum:registry timeslots[{booth:"$(booth)"}] run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"$(booth) timeslot has been updated.","color":"yellow"}]

# cap time
$scoreboard players set #time colosseum $(time)
execute if score #time colosseum matches 601.. run scoreboard players set #time colosseum 600

# create entry
$data modify storage colosseum:temp timeslot set value {booth:"$(booth)",mode:$(mode),position:$(position),rotation:$(rotation)}
execute store result storage colosseum:temp timeslot.time int 1 run scoreboard players get #time colosseum

# register
$execute unless data storage colosseum:registry timeslots[{booth:"$(booth)"}] run data modify storage colosseum:registry timeslots append from storage colosseum:temp timeslot
$execute unless data storage colosseum:registry timeslots[{booth:"$(booth)"}] run data modify storage colosseum:active timeslots append from storage colosseum:temp timeslot
$execute if data storage colosseum:registry timeslots[{booth:"$(booth)"}] run data modify storage colosseum:registry timeslots[{booth:"$(booth)"}] set from storage colosseum:temp timeslot
$execute if data storage colosseum:registry timeslots[{booth:"$(booth)"}] run data modify storage colosseum:active timeslots[{booth:"$(booth)"}] set from storage colosseum:temp timeslot
