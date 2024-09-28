
# set target
data modify storage util_npc:activate_conversation line set from storage util_npc:activate_conversation dialogue_entry.lines[0]

# check conditions
function util_npc:utility/condition_check/run {input_storage:"util_npc:activate_conversation line.conditions",output_score:"#condition_passed util_npc"}

# speak
execute if score #condition_passed util_npc matches 1 run function util_npc:utility/activate_conversation/speak

# loop
data remove storage util_npc:activate_conversation dialogue_entry.lines[0]
execute if data storage util_npc:activate_conversation dialogue_entry.lines[0] run function util_npc:utility/activate_conversation/lines/process_lines
