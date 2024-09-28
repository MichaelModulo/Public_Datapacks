# Will read through an array of conversations and will remove conversations that are not valid.
# $input_storage = array of conversation
# $input_score = specified conversation type  
# $output_storage = array of conversation

data modify storage util_npc:check_conversations debug set value ["[Debug] Check: "]

data remove storage util_npc:check_conversations conversations
$data modify storage util_npc:check_conversations conversations set from storage $(input_storage)
$data remove storage $(input_storage)
$scoreboard players operation #check_conversations.conversation_type util_npc = $(input_score)
data remove storage util_npc:check_conversations new_conversations
function util_npc:utility/check_conversations/process_conversations
$data modify storage $(output_storage) set from storage util_npc:check_conversations new_conversations

tellraw @a[distance=..10,tag=util_npc_debug_check_conversations] {"nbt":"debug","storage":"util_npc:check_conversations","interpret":true,"color":"yellow"}
