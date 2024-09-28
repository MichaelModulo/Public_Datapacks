
#function colosseum:api/round/remove {id:1234567}

# verify timeslot
$execute if data storage colosseum:active rounds[{id:$(id)}] run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"Round with the id '$(id)' was removed.","color":"green"}]
$execute unless data storage colosseum:active rounds[{id:$(id)}] run tellraw @s [{"text":"[Summit] ","color":"aqua"},{"text":"No round with that id was found.","color":"red"}]
$execute unless data storage colosseum:active rounds[{id:$(id)}] run return -1

# remove
$data remove storage colosseum:active rounds[{id:$(id)}]
