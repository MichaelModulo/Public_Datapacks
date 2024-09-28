
# get player head data and put in storage
data remove storage colosseum:player_head profile
execute in minecraft:overworld run loot spawn ~ -1000 ~ loot colosseum:technical/player_head
execute in minecraft:overworld positioned ~ -1000 ~ run data modify storage colosseum:player_head profile set from entity @e[type=item,limit=1,distance=..0.1,sort=nearest] Item.components."minecraft:profile"
execute in minecraft:overworld positioned ~ -1000 ~ run kill @e[type=item,limit=1,distance=..0.1,sort=nearest]
