# Will read through an array of conversations and will put the conversations in order.
# $input_storage = array of conversation
# $output_storage = array of conversation

data modify storage util_npc:order_conversations debug set value ["[Debug] Order: "]

$data modify storage util_npc:order_conversations conversations set from storage $(input_storage)
$data remove storage $(input_storage)
data remove storage util_npc:order_conversations new_conversations

$data modify storage util_npc:test fml set from storage $(input_storage)

data remove storage util_npc:order_conversations extra_conversations
scoreboard players set #order_conversations.priority_target util_npc 1
function util_npc:utility/order_conversations/process_conversations
data modify storage util_npc:order_conversations conversations set from storage util_npc:order_conversations extra_conversations

data remove storage util_npc:order_conversations extra_conversations
scoreboard players set #order_conversations.priority_target util_npc 2
function util_npc:utility/order_conversations/process_conversations
data modify storage util_npc:order_conversations conversations set from storage util_npc:order_conversations extra_conversations

data remove storage util_npc:order_conversations extra_conversations
scoreboard players set #order_conversations.priority_target util_npc 3
function util_npc:utility/order_conversations/process_conversations
data modify storage util_npc:order_conversations conversations set from storage util_npc:order_conversations extra_conversations

data remove storage util_npc:order_conversations extra_conversations
scoreboard players set #order_conversations.priority_target util_npc 4
function util_npc:utility/order_conversations/process_conversations
data modify storage util_npc:order_conversations conversations set from storage util_npc:order_conversations extra_conversations

$data modify storage $(output_storage) set from storage util_npc:order_conversations new_conversations

tellraw @a[distance=..10,tag=util_npc_debug_order_conversations] {"nbt":"debug","storage":"util_npc:order_conversations","interpret":true,"color":"yellow"}
