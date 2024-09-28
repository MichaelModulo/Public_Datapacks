
# set interact mode
scoreboard players set #interaction_mode util_npc 3

# [DEBUG]
data remove storage util_npc:debug path

# add tag
tag @a[distance=..15] add util_npc_target_player

# execute as npc
function util_npc:conversation/event_interaction/npc

# remove tag
tag @a[distance=..15] remove util_npc_target_player

# [DEBUG]
data remove storage util_npc:debug backlog[100]
data modify storage util_npc:debug backlog prepend from storage util_npc:debug path
tellraw @a[distance=..10,tag=util_npc_debug] {"nbt":"path","storage":"util_npc:debug","interpret": true,"color":"red"}
