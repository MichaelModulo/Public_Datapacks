
#(as player)
#function colosseum:panel/join

# verify rounds
execute unless data storage colosseum:active timeslot{mode:"panel"} run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"No panel is active during this timeslot.","color":"red"}]
execute unless data storage colosseum:active timeslot{mode:"panel"} run return -1

function colosseum:player/join {booth:"Panel"}
