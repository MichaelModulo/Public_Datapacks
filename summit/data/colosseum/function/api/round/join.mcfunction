
#(as player)
#function colosseum:api/round/join {booth:"The Shulker Box"}

# verify rounds
execute unless data storage colosseum:active timeslot{mode:"free_for_all"} run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"Free for all is not enabled, no direct joining.","color":"red"}]
execute unless data storage colosseum:active timeslot{mode:"free_for_all"} run return -1

# verify timeslot
$execute unless data storage colosseum:active timeslot{booth:"$(booth)"} unless data storage colosseum:active timeslot{booth:"Any Booth"} run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"Wrong timeslot for this booth.","color":"red"}]
$execute unless data storage colosseum:active timeslot{booth:"$(booth)"} unless data storage colosseum:active timeslot{booth:"Any Booth"} run return -2

$function colosseum:player/join {booth:"$(booth)"}
