
data modify storage util_npc:ungroup_conversations debug append value " "

scoreboard players set #ungroup_conversations.ungrouped_conversation util_npc 0
data modify storage util_npc:ungroup_conversations conversations set from storage util_npc:ungroup_conversations new_conversations
data remove storage util_npc:ungroup_conversations new_conversations
function util_npc:utility/ungroup_conversations/process_conversations
