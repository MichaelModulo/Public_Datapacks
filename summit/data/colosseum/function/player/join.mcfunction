
# store booth
function colosseum:utility/get_head
data modify storage colosseum:temp macro.name set from storage colosseum:player_head profile.name
data modify storage colosseum:temp macro.uuid set from storage colosseum:player_head profile.id
$data modify storage colosseum:temp macro.booth set value "$(booth)"
data modify storage colosseum:temp macro.inventory set from entity @s Inventory
function colosseum:utility/database/store_data with storage colosseum:temp macro

scoreboard players reset @s colesseum.death
scoreboard players reset @s colesseum.leave
tag @s add summit_colosseum_player

clear @s

spreadplayers -157 -28 15 15 under 67 false @s

function #colosseum:api/player/join
