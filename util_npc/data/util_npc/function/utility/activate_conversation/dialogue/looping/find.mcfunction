
# set target
$data modify storage util_npc:activate_conversation dialogue_entry set from storage util_npc:activate_conversation dialogue_entries[$(index)]

# check conditions
function util_npc:utility/condition_check/run {input_storage:"util_npc:activate_conversation dialogue_entry.conditions",output_score:"#condition_passed.chosen util_npc"}

# speak
execute if score #condition_passed.chosen util_npc matches 1 run function util_npc:utility/activate_conversation/dialogue/looping/found
execute if score #condition_passed.chosen util_npc matches 1 run return 0

# set next index
scoreboard players add #activate_conversation.looping_search.index util_npc 1
execute if score #activate_conversation.looping_search.index util_npc >= #dialogue_progress_max util_npc run scoreboard players remove #activate_conversation.looping_search.maximum_loops util_npc 1
execute if score #activate_conversation.looping_search.maximum_loops util_npc matches 0.. if score #activate_conversation.looping_search.index util_npc >= #dialogue_progress_max util_npc run scoreboard players set #activate_conversation.looping_search.index util_npc 0


# loop
execute store result storage util_npc:macro find_dialogue.index int 1 run scoreboard players get #activate_conversation.looping_search.index util_npc
execute if score #activate_conversation.looping_search.index util_npc < #dialogue_progress_max util_npc run function util_npc:utility/activate_conversation/dialogue/looping/find with storage util_npc:macro find_dialogue
