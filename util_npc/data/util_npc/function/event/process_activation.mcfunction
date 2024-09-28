
# get data
data modify storage util_npc:reference interaction_raw set from entity @s
execute on vehicle run data modify storage util_npc:reference entity_raw set from entity @s
execute on passengers run data modify storage util_npc:reference marker_raw set from entity @s
data modify storage util_npc:reference npc_data set from storage util_npc:reference marker_raw.data.util_npc

# process event
function util_npc:event/process_event
