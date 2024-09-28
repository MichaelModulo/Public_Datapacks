
# check conditions
function util_npc:utility/condition_check/run {input_storage:"util_npc:ungroup_trades conversation.conditions",output_score:"#condition_passed util_npc"}

# [DEBUG]
execute unless score #condition_passed util_npc matches 1 run data modify storage util_npc:ungroup_trades debug append value "!"

# cancel if failed condtion
execute unless score #condition_passed util_npc matches 1 run return 0

# check if group and rebuild array
data modify storage util_npc:ungroup_trades conversation_ids set from storage util_npc:ungroup_trades conversation.ids
execute if score #condition_passed util_npc matches 1 run function util_npc:utility/ungroup_trades/process_ids
