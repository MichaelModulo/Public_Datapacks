# Will read through an array of trades and will remove trades that fail to meet the conditions set.
# $input_storage = array of trade
# $output_storage = array of trade

data modify storage util_npc:condition_check_trades debug set value ["[Debug] Condition: "]

$data modify storage util_npc:condition_check_trades trades set from storage $(input_storage)
data remove storage util_npc:condition_check_trades new_trades
function util_npc:utility/condition_check_trades/process_trades
$data remove storage $(output_storage)
$data modify storage $(output_storage) set from storage util_npc:condition_check_trades new_trades

tellraw @a[distance=..10,tag=util_npc_debug_condition_check_trades] {"nbt":"debug","storage":"util_npc:condition_check_trades","interpret":true,"color":"yellow"}
