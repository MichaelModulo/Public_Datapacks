# Will read through an array of conversations and upon finding a group it will search for the matching conversations and add them to the array.
# $input_storage = array of conversation
# $output_storage = array of conversation

data modify storage util_npc:ungroup_conversations debug set value ["[Debug] Ungroup: "]

scoreboard players set #ungroup_conversations.ungrouped_conversation util_npc 0
scoreboard players set #ungroup_conversations.maximum_ungroups_left util_npc 10
$data modify storage util_npc:ungroup_conversations conversations set from storage $(input_storage)
$data remove storage $(input_storage)
data remove storage util_npc:ungroup_conversations new_conversations
function util_npc:utility/ungroup_conversations/process_conversations
$data modify storage $(output_storage) set from storage util_npc:ungroup_conversations new_conversations

tellraw @a[distance=..10,tag=util_npc_debug_ungroup_conversations] {"nbt":"debug","storage":"util_npc:ungroup_conversations","interpret":true,"color":"yellow"}
