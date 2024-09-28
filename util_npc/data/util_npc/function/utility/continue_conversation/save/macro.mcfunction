
# set storage key
data modify storage util_npc:reference storage_keys.conversation_id set from storage util_npc:continue_conversation/save conversation.id

# load conversation save
data modify storage util_npc:load_conversation macro set from storage util_npc:reference storage_keys
data modify storage util_npc:load_conversation macro.conversation set from storage util_npc:continue_conversation/save conversation
execute unless data storage util_npc:continue_conversation/save conversation{save:"npc"} run function util_npc:storage/conversation/load_player with storage util_npc:load_conversation macro
execute if data storage util_npc:continue_conversation/save conversation{save:"npc"} run function util_npc:storage/conversation/load_npc with storage util_npc:load_conversation macro

# set expiration time
execute store result score #continue_conversation.add.new_expiration util_npc run time query gametime
execute store result score #continue_conversation.add.expiration_delay util_npc run data get storage util_npc:continue_conversation/save conversation.continuation.expiration
scoreboard players operation #continue_conversation.add.new_expiration util_npc += #continue_conversation.add.expiration_delay util_npc

# save to memory
data modify storage util_npc:continue_conversation/save continue_data.type set from storage util_npc:continue_conversation/save conversation.type
data modify storage util_npc:continue_conversation/save continue_data.id set from storage util_npc:continue_conversation/save conversation.id
execute if score #continue_conversation.add.expiration_delay util_npc matches 1.. store result storage util_npc:continue_conversation/save continue_data.expiration int 1 run scoreboard players get #continue_conversation.add.new_expiration util_npc
execute unless score #continue_conversation.add.expiration_delay util_npc matches 1.. run data remove storage util_npc:continue_conversation/save continue_data.expiration

# remove if finished
execute store result score #dialogue_progress_value util_npc run data get storage util_npc:reference conversation_save.value
execute store result score #dialogue_progress_max util_npc run data get storage util_npc:continue_conversation/save conversation.dialogue
scoreboard players operation #continuation.progress util_npc = #dialogue_progress_value util_npc
scoreboard players add #continuation.progress util_npc 1
execute if score #continuation.progress util_npc > #dialogue_progress_max util_npc run scoreboard players set #continuation.progress util_npc 1
execute if score #continuation.progress util_npc = #dialogue_progress_max util_npc unless data storage util_npc:continue_conversation/save conversation{mode:"looping"}.continuation{looping:true} run data remove storage util_npc:continue_conversation/save continue_data

# forward
execute if data storage util_npc:continue_conversation/save conversation.continuation.forward unless data storage util_npc:continue_conversation/save continue_data run function util_npc:utility/continue_conversation/save/forward
