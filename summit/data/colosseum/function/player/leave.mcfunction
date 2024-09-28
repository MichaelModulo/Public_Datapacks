
# get data
function colosseum:utility/get_head
data modify storage colosseum:temp macro.uuid set from storage colosseum:player_head profile.id
function colosseum:utility/database/get_data with storage colosseum:temp macro

scoreboard players reset @s colesseum.death
scoreboard players reset @s colesseum.leave
tag @s remove summit_colosseum_player

clear @s *[minecraft:custom_data={booth:"Colosseum"}]

data modify storage colosseum:temp timeslots set from storage colosseum:registry timeslots
data modify storage colosseum:temp timeslots append value {booth:"Panel",time:6000,position:[0d,77d,-145d],rotation:[0.0f,0.0f],mode:"panel"}
function colosseum:utility/booth_tp/run with storage colosseum:return database

function colosseum:utility/return_items/run

function #colosseum:api/player/leave
