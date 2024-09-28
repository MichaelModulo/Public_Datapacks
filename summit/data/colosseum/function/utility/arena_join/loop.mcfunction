
data modify storage colosseum:temp macro.player set from storage colosseum:process players[0]
function colosseum:utility/arena_join/teleport with storage colosseum:temp macro

data remove storage colosseum:process players[0]
execute if data storage colosseum:process players[0] run function colosseum:utility/arena_join/loop
