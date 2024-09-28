
# [DEBUG]
data remove storage util_npc:debug path

# set interact mode
$scoreboard players set #interaction_mode util_npc $(mode)

# tag
$execute as @a[name=$(player_name)] run tag @s add util_npc_target_player

# player
$execute as @a[name=$(player_name)] run function util_npc:conversation/direct_interaction/player

# npc
$execute as @e[type=interaction,tag=$(npc_tag),tag=util_npc_interaction,tag=util_npc_interactable,distance=..7,sort=nearest,limit=1] run function util_npc:npc/interacted_with

# untag
$execute as @a[name=$(player_name)] run tag @s remove util_npc_target_player

# [DEBUG]
data remove storage util_npc:debug backlog[100]
data modify storage util_npc:debug backlog prepend from storage util_npc:debug path
tellraw @a[distance=..10,tag=util_npc_debug] {"nbt":"path","storage":"util_npc:debug","interpret": true,"color":"red"}
