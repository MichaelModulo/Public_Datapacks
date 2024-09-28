
# cancel if wrong mode
$execute if data storage $(input_conversation){mode:"random"} run return 0
$execute if data storage $(input_conversation){mode:"first_valid"} run return 0

# load conversation
$data modify storage util_npc:continue_conversation/save conversation set from storage $(input_conversation)

# add
function util_npc:utility/continue_conversation/save/macro

# save conversation
$data remove storage $(continue_save)
$data modify storage $(continue_save) set from storage util_npc:continue_conversation/save continue_data
