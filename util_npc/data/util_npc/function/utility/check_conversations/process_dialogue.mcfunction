
# target
data modify storage util_npc:check_conversations dialogue set from storage util_npc:check_conversations dialogue_lines[0]
data remove storage util_npc:check_conversations dialogue_lines[0]

# check conditions
function util_npc:utility/condition_check/run {input_storage:"util_npc:check_conversations dialogue.conditions",output_score:"#check_conversations.condition_passed_dial util_npc"}

# loop
execute unless score #check_conversations.condition_passed_dial util_npc matches 1 if data storage util_npc:check_conversations dialogue_lines[0] run function util_npc:utility/check_conversations/process_dialogue
