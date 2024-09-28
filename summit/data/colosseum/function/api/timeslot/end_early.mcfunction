
#function colosseum:api/timeslot/end_early {booth:"The Shulker Box"}

# verify
$execute if data storage colosseum:active timeslot{booth:"$(booth)"} run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"$(booth) timeslot has been ended early.","color":"green"}]
$execute unless data storage colosseum:active timeslot{booth:"$(booth)"} run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"Wrong timeslot for this booth.","color":"red"}]
$execute unless data storage colosseum:active timeslot{booth:"$(booth)"} run return -1

# end early
function colosseum:timeslot/next
