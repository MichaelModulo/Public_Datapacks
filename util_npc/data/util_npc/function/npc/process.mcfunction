
# get data
data modify storage util_npc:reference interaction_raw set from entity @s
execute on vehicle run data modify storage util_npc:reference entity_raw set from entity @s
execute on passengers run data modify storage util_npc:reference marker_raw set from entity @s
data modify storage util_npc:reference npc_data set from storage util_npc:reference marker_raw.data.util_npc

# load npc data
data modify storage util_npc:reference storage_keys.npc_id set from storage util_npc:reference npc_data.id
function util_npc:storage/npc/load with storage util_npc:reference storage_keys

# save entity position
data remove storage util_npc:temp temp
execute on vehicle run data modify storage util_npc:temp temp set from entity @s Pos
execute if data storage util_npc:temp temp on passengers run data modify entity @s data.util_npc.save.last_coords set from storage util_npc:temp temp
data remove storage util_npc:temp temp
execute on vehicle run data modify storage util_npc:temp temp set from entity @s CustomName
execute if data storage util_npc:temp temp on passengers run data modify entity @s data.util_npc.save.conversion.name set from storage util_npc:temp temp

# FUNCTION TAG
function #util_npc:process_npc

# process events
function util_npc:event/process_detection

# conversion
scoreboard players set #found_conversion util_npc 0
execute on vehicle run scoreboard players set #found_conversion util_npc -1
execute unless score #found_conversion util_npc matches -1 if data storage util_npc:reference npc_data.config.conversions run function util_npc:npc/conversion/init
execute if score #found_conversion util_npc matches 1..2 run return 0

# if entity is dead, delete all units
scoreboard players set #enity_exists util_npc 0
execute on vehicle run scoreboard players set #enity_exists util_npc 1
execute unless score #enity_exists util_npc matches 1 unless data storage util_npc:reference npc_data.config{auto_death_respawn:1b} run function util_npc:npc/despawn
execute unless score #enity_exists util_npc matches 1 if data storage util_npc:reference npc_data.config{auto_death_respawn:1b} run function util_npc:npc/respawn

# look at player
execute if data storage util_npc:reference npc_data.config{look_at_player:1b} on vehicle at @s anchored eyes facing entity @p[gamemode=!spectator] eyes run tp ~ ~ ~

# save npc data
function util_npc:storage/npc/save with storage util_npc:reference storage_keys

# FUNCTION TAG
function #util_npc:process_npc_post
