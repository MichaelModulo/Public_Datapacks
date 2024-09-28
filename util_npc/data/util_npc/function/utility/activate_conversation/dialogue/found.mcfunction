
# speak
function util_npc:utility/activate_conversation/lines/process_lines

# loot reward
data modify storage util_npc:macro speak_loot.loot_table set from storage util_npc:activate_conversation dialogue_entry.loot
execute if data storage util_npc:activate_conversation dialogue_entry.loot run function util_npc:utility/activate_conversation/loot with storage util_npc:macro speak_loot

# run command
data modify storage util_npc:macro speak_run_command.command set from storage util_npc:activate_conversation dialogue_entry.run_command
execute if data storage util_npc:activate_conversation dialogue_entry.run_command run function util_npc:utility/activate_conversation/run_command with storage util_npc:macro speak_run_command

# refresh trades
execute if data storage util_npc:activate_conversation dialogue_entry{refresh_trades:true} on vehicle run function util_npc:trade/refresh/init

# interaction delay
execute store result score #interaction_delay.new util_npc run time query gametime
execute store result score #interaction_delay.addition util_npc run data get storage util_npc:activate_conversation dialogue_entry.delay
scoreboard players operation #interaction_delay.new util_npc += #interaction_delay.addition util_npc
execute unless score #interaction_mode util_npc matches 3 store result storage util_npc:reference player_save.memory.interaction_delay int 1 run scoreboard players get #interaction_delay.new util_npc

# dont save if not needed
execute unless data storage util_npc:activate_conversation conversation{mode:"linear"} unless data storage util_npc:activate_conversation conversation{mode:"looping"} run return 0

# store progress
execute store result storage util_npc:reference conversation_save.value int 1 run scoreboard players get #dialogue_progress_value util_npc
execute if score #dialogue_progress_value util_npc >= #dialogue_progress_max util_npc if data storage util_npc:activate_conversation conversation{mode:"linear"} run data modify storage util_npc:reference conversation_save.status set value "complete"

# save conversation data
execute unless data storage util_npc:activate_conversation conversation{save:"npc"} run function util_npc:storage/conversation/save_player with storage util_npc:reference storage_keys
execute if data storage util_npc:activate_conversation conversation{save:"npc"} run function util_npc:storage/conversation/save_npc with storage util_npc:reference storage_keys
