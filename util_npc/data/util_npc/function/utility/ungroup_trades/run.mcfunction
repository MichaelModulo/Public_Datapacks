# Will read through an array of trades and upon finding a group it will search for the matching trades and add them to the array.
# $input_storage = array of conversation
# $output_storage = array of conversation

data modify storage util_npc:ungroup_trades debug set value ["[Debug] Ungroup: "]

scoreboard players set #ungroup_trades.ungrouped_conversation util_npc 0
scoreboard players set #ungroup_trades.maximum_ungroups_left util_npc 10
$data modify storage util_npc:ungroup_trades trades set from storage $(input_storage)
$data remove storage $(input_storage)
data remove storage util_npc:ungroup_trades new_trades
function util_npc:utility/ungroup_trades/process_trades
$data modify storage $(output_storage) set from storage util_npc:ungroup_trades new_trades

tellraw @a[distance=..10,tag=util_npc_debug_ungroup_trades] {"nbt":"debug","storage":"util_npc:ungroup_trades","interpret":true,"color":"yellow"}
