
# set index
scoreboard players operation #activate_conversation.linear_search.index util_npc = #dialogue_progress_value util_npc

# find dialogue
scoreboard players set #activate_conversation.linear_search.maximum_loops util_npc 1
execute store result storage util_npc:macro find_dialogue.index int 1 run scoreboard players get #activate_conversation.linear_search.index util_npc
execute if score #activate_conversation.linear_search.index util_npc < #dialogue_progress_max util_npc run function util_npc:utility/activate_conversation/dialogue/linear/find with storage util_npc:macro find_dialogue
