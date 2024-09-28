
# set target
data modify storage util_npc:condition_check_trades trade set from storage util_npc:condition_check_trades trades[0]
data remove storage util_npc:condition_check_trades trades[0]

# check conditions
function util_npc:utility/condition_check/run {input_storage:"util_npc:condition_check_trades trade.conditions",output_score:"#condition_check_trades.condition_passed util_npc"}

# store if passed
execute if score #condition_check_trades.condition_passed util_npc matches 1 run data modify storage util_npc:condition_check_trades new_trades append from storage util_npc:condition_check_trades trade

# BUG FIX
execute if score #condition_check_trades.condition_passed util_npc matches 1 run data modify storage util_npc:trade_validation trade_ids append from storage util_npc:condition_check_trades trade.id

# [DEBUG]
execute if score #condition_check_trades.condition_passed util_npc matches 1 run tellraw @a[distance=..10,tag=util_npc_debug_condition_check_trades] [{"text":"[Debug] Valid (","color":"yellow"},{"nbt":"trade.id","storage":"util_npc:condition_check_trades","color":"gold"},{"text":")","color":"yellow"}]
execute unless data storage util_npc:condition_check_trades trade.conditions run data modify storage util_npc:condition_check_trades debug append value "-"
execute if data storage util_npc:condition_check_trades trade.conditions unless score #condition_check_trades.condition_passed util_npc matches 1 run data modify storage util_npc:condition_check_trades debug append value "❌"
execute if data storage util_npc:condition_check_trades trade.conditions if score #condition_check_trades.condition_passed util_npc matches 1 run data modify storage util_npc:condition_check_trades debug append value "✔"

# loop
execute if data storage util_npc:condition_check_trades trades[0] run function util_npc:utility/condition_check_trades/process_trades
