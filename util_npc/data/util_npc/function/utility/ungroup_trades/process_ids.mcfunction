
# flag for a rerun
scoreboard players set #ungroup_trades.ungrouped_conversation util_npc 1

# set target
data modify storage util_npc:ungroup_trades conversation_id set from storage util_npc:ungroup_trades conversation_ids[0]

# find match
data modify storage util_npc:macro ungroup_find_match.conversation_id set from storage util_npc:ungroup_trades conversation_id
function util_npc:utility/ungroup_trades/found_matching_id with storage util_npc:macro ungroup_find_match

# loop
data remove storage util_npc:ungroup_trades conversation_ids[0]
execute if data storage util_npc:ungroup_trades conversation_ids[0] run function util_npc:utility/ungroup_trades/process_ids
