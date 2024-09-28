
# exit if no continuation
$execute unless data storage $(continue_save) run return 0

# load conversation data
$data modify storage util_npc:continue_conversation/load continue_save set from storage $(continue_save)

# check continuation expiration
execute store result score #continue_conversation.load.gametime util_npc run time query gametime
execute store result score #continue_conversation.load.current_expiration util_npc run data get storage util_npc:continue_conversation/load continue_save.expiration
execute if score #continue_conversation.load.current_expiration util_npc matches 0 run scoreboard players set #continue_conversation.load.gametime util_npc -1

# load conversation
function util_npc:utility/continue_conversation/load/macro with storage util_npc:continue_conversation/load continue_save

# output conversation
$data modify storage $(output_conversation) set from storage util_npc:continue_conversation/load conversation
