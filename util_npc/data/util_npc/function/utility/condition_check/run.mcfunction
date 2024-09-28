# Will check if the condtions have been met.
# $input_storage = array of conversation
# $output_score = array of conversation

scoreboard players set #condition_check.condition_passed util_npc 1
data remove storage util_npc:condition_check conditions
$data modify storage util_npc:condition_check conditions set from storage $(input_storage)
$execute if data storage $(input_storage) run function util_npc:utility/condition_check/check
$scoreboard players operation $(output_score) = #condition_check.condition_passed util_npc
data remove storage util_npc:condition_check conditions
