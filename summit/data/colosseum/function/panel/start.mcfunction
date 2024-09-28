
data remove storage colosseum:active timeslots
data modify storage colosseum:active timeslot set value {booth:"Panel",time:6000,position:[0d,77d,-145d],rotation:[0.0f,0.0f],mode:"panel"}

data modify storage colosseum:active registry append value {booth:"Panel",time:6000,position:[0d,77d,-145d],rotation:[0.0f,0.0f],mode:"panel"}

function colosseum:timeslot/start
