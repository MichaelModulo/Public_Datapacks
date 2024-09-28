# Will choose a conversation in order or at random.
# @param : input_storage = location to the nbt of a conversation
# &uses_storage = util_npc:reference: player_save, conversation_save, storage_keys, npc_data

# copy input
$data modify storage util_npc:activate_conversation conversation set from storage $(input_storage)

# DEBUG
data modify storage util_npc:debug path append value "(Conversation: "
data modify storage util_npc:debug path append from storage util_npc:activate_conversation conversation.id
data modify storage util_npc:debug path append value ") "

# set storage key
data modify storage util_npc:reference storage_keys.conversation_id set from storage util_npc:activate_conversation conversation.id

# load conversation data and progress
data modify storage util_npc:load_conversation macro set from storage util_npc:reference storage_keys
data modify storage util_npc:load_conversation macro.conversation set from storage util_npc:activate_conversation conversation
execute unless data storage util_npc:activate_conversation conversation{save:"npc"} run function util_npc:storage/conversation/load_player with storage util_npc:load_conversation macro
execute if data storage util_npc:activate_conversation conversation{save:"npc"} run function util_npc:storage/conversation/load_npc with storage util_npc:load_conversation macro
execute store result score #dialogue_progress_value util_npc run data get storage util_npc:reference conversation_save.value
execute store result score #dialogue_progress_max util_npc run data get storage util_npc:activate_conversation conversation.dialogue

# activate conversation
data modify storage util_npc:activate_conversation dialogue_entries set from storage util_npc:activate_conversation conversation.dialogue
execute if data storage util_npc:activate_conversation conversation{mode:"linear"} run function util_npc:utility/activate_conversation/dialogue/linear/init
execute if data storage util_npc:activate_conversation conversation{mode:"looping"} run function util_npc:utility/activate_conversation/dialogue/looping/init
execute if data storage util_npc:activate_conversation conversation{mode:"first_valid"} run function util_npc:utility/activate_conversation/dialogue/first_valid/init
execute if data storage util_npc:activate_conversation conversation{mode:"random"} run function util_npc:utility/activate_conversation/dialogue/random/init
