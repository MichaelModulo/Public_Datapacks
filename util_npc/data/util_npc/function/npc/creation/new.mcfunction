
# set entity data
execute on vehicle run data modify entity @s {} merge from storage util_npc:setup npc.entity.data
execute on vehicle run data modify entity @s Tags append from storage util_npc:setup npc.tag
execute on vehicle run tag @s add smithed.strict

# set interaction data
data modify entity @s {} merge from storage util_npc:setup npc.interaction.data
data modify entity @s CustomName set from storage util_npc:setup npc.entity.data.CustomName
data modify entity @s CustomNameVisible set from storage util_npc:setup npc.entity.data.CustomNameVisible
data modify entity @s Tags append from storage util_npc:setup npc.tag
tag @s add util_npc_interactable
tag @s remove util_npc_setup

# set marker data
execute on passengers run data modify entity @s data.util_npc merge from storage util_npc:setup npc
execute on passengers run data modify entity @s Tags append from storage util_npc:setup npc.tag

# set location for respawn
execute if data storage util_npc:setup npc.save.last_coords on vehicle run data modify entity @s Pos set from storage util_npc:setup npc.save.last_coords
