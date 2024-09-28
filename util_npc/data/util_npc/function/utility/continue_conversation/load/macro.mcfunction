
# load conversation
data remove storage util_npc:continue_conversation/load conversation
$data modify storage util_npc:continue_conversation/load conversation_check set from storage util_npc:reference npc_data.conversations[{id:"$(id)"}]
$execute if data storage util_npc:continue_conversation/load conversation_check.continuation{source:"loaded"} run data modify storage util_npc:continue_conversation/load conversation set from storage util_npc:reference loaded_conversations[{id:"$(id)"}]
$execute if data storage util_npc:continue_conversation/load conversation_check.continuation{source:"ungrouped"} run data modify storage util_npc:continue_conversation/load conversation set from storage util_npc:reference ungrouped_conversations[{id:"$(id)"}]
$execute if data storage util_npc:continue_conversation/load conversation_check.continuation{source:"valid"} run data modify storage util_npc:continue_conversation/load conversation set from storage util_npc:reference valid_conversations[{id:"$(id)"}]
$execute if data storage util_npc:continue_conversation/load conversation_check.continuation{source:"reserve"} run data modify storage util_npc:continue_conversation/load conversation set from storage util_npc:reference reserve_conversations[{id:"$(id)"}]
$execute if data storage util_npc:continue_conversation/load conversation_check.continuation{source:"all"} run data modify storage util_npc:continue_conversation/load conversation set from storage util_npc:reference npc_data.conversations[{id:"$(id)"}]

# reset progress
$execute if score #continue_conversation.load.gametime util_npc >= #continue_conversation.load.current_expiration util_npc if data storage util_npc:continue_conversation/load conversation.continuation{reset:true} unless data storage util_npc:continue_conversation/load conversation{save:"npc"} run data modify storage util_npc:reference player_save.conversations[{id:"$(id)"}].value set value 0
$execute if score #continue_conversation.load.gametime util_npc >= #continue_conversation.load.current_expiration util_npc if data storage util_npc:continue_conversation/load conversation.continuation{reset:true} if data storage util_npc:continue_conversation/load conversation{save:"npc"} run data modify storage util_npc:reference npc_save.conversations[{id:"$(id)"}].value set value 0

# remove conversation
execute if score #continue_conversation.load.gametime util_npc >= #continue_conversation.load.current_expiration util_npc if data storage util_npc:continue_conversation/load conversation.continuation{exit:true} run data remove storage util_npc:continue_conversation/load conversation
