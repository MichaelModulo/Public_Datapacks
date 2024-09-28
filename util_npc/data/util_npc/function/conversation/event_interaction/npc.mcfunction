
# load npc and raw data, remove npc from raw
data modify storage util_npc:reference interaction_raw set from entity @s
execute on vehicle run data modify storage util_npc:reference entity_raw set from entity @s
execute on passengers run data modify entity @s data.util_npc.entity.data set from storage util_npc:reference entity_raw
execute on passengers run data remove entity @s data.util_npc.entity.data.Passengers
execute on passengers run data modify storage util_npc:reference marker_raw set from entity @s
data modify storage util_npc:reference npc_data set from storage util_npc:reference marker_raw.data.util_npc

# look at player
execute if data storage util_npc:reference npc_data.config{look_at_player:1b} on vehicle at @s anchored eyes facing entity @a[tag=util_npc_target_player,sort=nearest,limit=1] eyes run tp ~ ~ ~

# load npc/player data
data modify storage util_npc:reference storage_keys.npc_id set from storage util_npc:reference npc_data.id
function util_npc:storage/npc/load with storage util_npc:reference storage_keys

# remove event from queue
data remove storage util_npc:reference event_active
data modify storage util_npc:reference event_active.id set from storage util_npc:reference npc_save.memory.events.queue[0]
data remove storage util_npc:reference npc_save.memory.events.queue[0]
execute unless data storage util_npc:reference npc_save.memory.events.queue[0] run tag @s remove util_npc_events_queued

# [DEBUG]
data modify storage util_npc:debug path append value "[Debug] (Event, "
data modify storage util_npc:debug path append from storage util_npc:reference npc_data.id
data modify storage util_npc:debug path append value ", "
data modify storage util_npc:debug path append from storage util_npc:reference event_active.id
data modify storage util_npc:debug path append value ") "

# initialize dialogue
function util_npc:conversation/interaction

# save npc/player data
function util_npc:storage/npc/save with storage util_npc:reference storage_keys

# pasted modified npc data into npc
execute on passengers run data modify entity @s data.util_npc set from storage util_npc:reference npc_data
