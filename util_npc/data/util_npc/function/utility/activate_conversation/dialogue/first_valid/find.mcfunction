
# set target
data modify storage util_npc:activate_conversation dialogue_entry set from storage util_npc:activate_conversation dialogue_entries[0]
data remove storage util_npc:activate_conversation dialogue_entries[0]

# check conditions
function util_npc:utility/condition_check/run {input_storage:"util_npc:activate_conversation dialogue_entry.conditions",output_score:"#condition_passed.chosen util_npc"}

# speak
execute if score #condition_passed.chosen util_npc matches 1 run function util_npc:utility/activate_conversation/dialogue/found
execute if score #condition_passed.chosen util_npc matches 1 run return 0

# move to next if needed
scoreboard players add #dialogue_progress_value util_npc 1
execute if data storage util_npc:activate_conversation dialogue_entries[0] run function util_npc:utility/activate_conversation/dialogue/first_valid/find
