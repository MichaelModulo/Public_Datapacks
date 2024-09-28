
# load npc and raw data, remove npc from raw
data modify storage util_npc:reference interaction_raw set from entity @s
execute on vehicle run data modify storage util_npc:reference entity_raw set from entity @s
execute on passengers run data modify entity @s data.util_npc.entity.data set from storage util_npc:reference entity_raw
execute on passengers run data remove entity @s data.util_npc.entity.data.Passengers
execute on passengers run data modify storage util_npc:reference marker_raw set from entity @s
data modify storage util_npc:reference npc_data set from storage util_npc:reference marker_raw.data.util_npc

# look at player
execute if data storage util_npc:reference npc_data.config{look_at_player:1b} on vehicle at @s anchored eyes facing entity @a[tag=util_npc_target_player,sort=nearest,limit=1] eyes run tp ~ ~ ~

# attack particles
execute if score #interaction_mode util_npc matches 2 if data storage util_npc:reference npc_data.config{attack_angry_particles:1b} run particle minecraft:angry_villager ~ ~ ~ .3 .3 .3 1 5

# [DEBUG]
execute if score #interaction_mode util_npc matches 1 run data modify storage util_npc:debug path append value "[Debug] (Talk, "
execute if score #interaction_mode util_npc matches 2 run data modify storage util_npc:debug path append value "[Debug] (Attack, "
data modify storage util_npc:debug path append from storage util_npc:reference storage_keys.player_name
data modify storage util_npc:debug path append value ", "
data modify storage util_npc:debug path append from storage util_npc:reference npc_data.id
data modify storage util_npc:debug path append value ") "

# load npc/player data
data modify storage util_npc:reference storage_keys.npc_id set from storage util_npc:reference npc_data.id
data modify storage util_npc:reference storage_keys.player_uuid set from storage util_npc:reference player_save.UUID
data modify storage util_npc:reference storage_keys.player_name set from storage util_npc:reference player_save.Name
function util_npc:storage/npc/load with storage util_npc:reference storage_keys
function util_npc:storage/player/load with storage util_npc:reference storage_keys

# check interaction delay
execute store result score #interaction_delay.time util_npc run time query gametime
execute store result score #interaction_delay.cooldown util_npc run data get storage util_npc:reference player_save.memory.interaction_delay
execute if score #interaction_delay.cooldown util_npc matches -1 store result score #interaction_delay.cooldown util_npc run time query gametime

# initialize dialogue
execute if score #interaction_delay.time util_npc >= #interaction_delay.cooldown util_npc run function util_npc:conversation/interaction

# save npc/player data
function util_npc:storage/player/save with storage util_npc:reference storage_keys
function util_npc:storage/npc/save with storage util_npc:reference storage_keys

# pasted modified npc data into npc
execute on passengers run data modify entity @s data.util_npc set from storage util_npc:reference npc_data
