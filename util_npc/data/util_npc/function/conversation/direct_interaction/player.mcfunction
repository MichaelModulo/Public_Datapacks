
# get player head data
function util_npc:player/get_head

# get player data
data modify storage util_npc:reference player_raw set from entity @s
data remove storage util_npc:reference player_save
data modify storage util_npc:reference player_save.UUID set from storage util_npc:reference player_head.id
data modify storage util_npc:reference player_save.Name set from storage util_npc:reference player_head.name
