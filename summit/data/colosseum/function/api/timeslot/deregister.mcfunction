
#function colosseum:api/timeslot/deregister {booth:"The Shulker Box"}

# verify
$execute if data storage colosseum:registry timeslots[{booth:"$(booth)"}] run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"$(booth) timeslot has been deregistered.","color":"green"}]
$execute unless data storage colosseum:registry timeslots[{booth:"$(booth)"}] run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"$(booth) timeslot does not exist.","color":"red"}]
$execute unless data storage colosseum:registry timeslots[{booth:"$(booth)"}] run return -1

# deregister
$data remove storage colosseum:registry timeslots[{booth:"$(booth)"}]
$data remove storage colosseum:active timeslots[{booth:"$(booth)"}]
