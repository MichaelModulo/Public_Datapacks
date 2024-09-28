
# load values
execute store result score $players.min colosseum run data get storage colosseum:active timeslot.players.min
execute store result score $players.max colosseum run data get storage colosseum:active timeslot.players.max
execute store result score $time colosseum run data get storage colosseum:active timeslot.time

# set time
scoreboard players operation $time_left colosseum = $time colosseum

# start if not round based
execute if data storage colosseum:active timeslot{mode:"free_for_all"} run function colosseum:game/start
execute if data storage colosseum:active timeslot{mode:"panel"} run function colosseum:game/start

# announce
function colosseum:timeslot/announce with storage colosseum:active timeslot

function #colosseum:api/timeslot/start
