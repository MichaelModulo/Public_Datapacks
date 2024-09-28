
# set storage key
data modify storage util_npc:reference storage_keys.conversation_id set from storage util_npc:check_conversations conversation.id

# load conversation data and progress
data modify storage util_npc:load_conversation macro set from storage util_npc:reference storage_keys
data modify storage util_npc:load_conversation macro.conversation set from storage util_npc:check_conversations conversation
execute unless data storage util_npc:check_conversations conversation{save:"npc"} run function util_npc:storage/conversation/load_player with storage util_npc:load_conversation macro
execute if data storage util_npc:check_conversations conversation{save:"npc"} run function util_npc:storage/conversation/load_npc with storage util_npc:load_conversation macro
execute store result score #check_conversations.progress_value util_npc run data get storage util_npc:reference conversation_save.value
execute store result score #check_conversations.progress_max util_npc run data get storage util_npc:check_conversations conversation.dialogue
