
# random index
execute store result score #activate_conversation.looping_search.index util_npc run time query gametime
execute if predicate util_npc:random/50 run scoreboard players add #activate_conversation.looping_search.index util_npc 1
scoreboard players operation #activate_conversation.looping_search.index util_npc %= #dialogue_progress_max util_npc

# find dialogue
scoreboard players set #activate_conversation.looping_search.maximum_loops util_npc 1
execute store result storage util_npc:macro find_dialogue.index int 1 run scoreboard players get #activate_conversation.looping_search.index util_npc
function util_npc:utility/activate_conversation/dialogue/looping/find with storage util_npc:macro find_dialogue
