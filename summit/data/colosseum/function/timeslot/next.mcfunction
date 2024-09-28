
function #colosseum:api/timeslot/end

function colosseum:game/stop

execute if score #timeslots colosseum matches ..1 run function colosseum:timeslot/default
execute if score #timeslots colosseum matches ..1 run return 0

execute unless data storage colosseum:active timeslots[0] run data modify storage colosseum:active timeslots set from storage colosseum:registry timeslots

data modify storage colosseum:active timeslot set from storage colosseum:active timeslots[0]
data remove storage colosseum:active timeslots[0]

execute unless data storage colosseum:active timeslots[0] run data modify storage colosseum:active timeslots set from storage colosseum:registry timeslots

data remove storage colosseum:active rounds

function colosseum:timeslot/start
