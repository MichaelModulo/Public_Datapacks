
# [DEBUG]
data remove storage util_npc:debug path

# add tag
tag @s add util_npc_target_player

# direct interaction
function util_npc:conversation/direct_interaction/player

# execute as npc
execute as @e[type=interaction,tag=util_npc_interaction,tag=util_npc_interactable,distance=..7] at @s run function util_npc:npc/interaction_check

# remove tag
tag @s remove util_npc_target_player

# [DEBUG]
data remove storage util_npc:debug backlog[100]
data modify storage util_npc:debug backlog prepend from storage util_npc:debug path
tellraw @a[distance=..10,tag=util_npc_debug] {"nbt":"path","storage":"util_npc:debug","interpret": true,"color":"red"}
