
# set target
data modify storage util_npc:ungroup_conversations conversation set from storage util_npc:ungroup_conversations conversations[0]

# check if group and rebuild array
execute if data storage util_npc:ungroup_conversations conversation{type:"group"} run function util_npc:utility/ungroup_conversations/found_group
execute unless data storage util_npc:ungroup_conversations conversation{type:"group"} run data modify storage util_npc:ungroup_conversations new_conversations append from storage util_npc:ungroup_conversations conversation

# [DEBUG]
execute if data storage util_npc:ungroup_conversations conversation{type:"chat"} run data modify storage util_npc:ungroup_conversations debug append value "C"
execute if data storage util_npc:ungroup_conversations conversation{type:"attack"} run data modify storage util_npc:ungroup_conversations debug append value "A"
execute if data storage util_npc:ungroup_conversations conversation{type:"event"} run data modify storage util_npc:ungroup_conversations debug append value "E"
execute if data storage util_npc:ungroup_conversations conversation{type:"group"} run data modify storage util_npc:ungroup_conversations debug append value "❓"

# loop
data remove storage util_npc:ungroup_conversations conversations[0]
execute if data storage util_npc:ungroup_conversations conversations[0] run function util_npc:utility/ungroup_conversations/process_conversations

# reprocess if the there was a group
execute unless data storage util_npc:ungroup_conversations new_conversations[0] run return 0
scoreboard players remove #ungroup_conversations.maximum_ungroups_left util_npc 1
execute if score #ungroup_conversations.ungrouped_conversation util_npc matches 1 unless score #ungroup_conversations.maximum_ungroups_left util_npc matches ..0 unless data storage util_npc:ungroup_conversations conversations[0] run function util_npc:utility/ungroup_conversations/rerun
