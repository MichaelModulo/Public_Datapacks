
# get player head data and put in storage
data remove storage util_npc:player_head player_head
loot spawn ~ -1000 ~ loot util_npc:technical/player_head
execute positioned ~ -1000 ~ run data modify storage util_npc:reference player_head set from entity @e[type=item,limit=1,distance=..0.1,sort=nearest] Item.components."minecraft:profile"
execute positioned ~ -1000 ~ run kill @e[type=item,limit=1,distance=..0.1,sort=nearest]
