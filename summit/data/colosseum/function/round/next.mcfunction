
execute store result score #rounds colosseum run data get storage colosseum:active rounds
execute if score #rounds colosseum matches ..0 run return 0

data modify storage colosseum:active round set from storage colosseum:active rounds[0]
data remove storage colosseum:active rounds[0]

function colosseum:round/start
