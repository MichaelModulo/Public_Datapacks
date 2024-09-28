
# BUG FIX
data remove storage util_npc:trade_validation trade_ids

# get data
data modify storage util_npc:refresh_trades npc_reference set from entity @s
execute on passengers on passengers run data modify storage util_npc:trade_validation interaction_data set from entity @s data.util_npc.interaction

# set hitbox
execute on passengers run data modify entity @s {} merge from storage util_npc:trade_validation interaction_data.data

# backup npc trades and clear
data remove storage util_npc:reference backup_trade_data
data modify storage util_npc:reference backup_trade_data set from storage util_npc:refresh_trades npc_reference.Offers
data remove entity @s Offers.Recipes

# exit if not villager
execute unless data storage util_npc:refresh_trades npc_reference.VillagerData run return 0

# load trades
function util_npc:trade/refresh/load_trades
execute unless data storage util_npc:reference loaded_trades[0] run return 0

# validate trades
data modify storage util_npc:trade_validation trades set from storage util_npc:reference loaded_trades
function util_npc:utility/ungroup_trades/run {input_storage:"util_npc:trade_validation trades",output_storage:"util_npc:trade_validation trades"}
function util_npc:utility/condition_check_trades/run {input_storage:"util_npc:trade_validation trades",output_storage:"util_npc:trade_validation trades"}
data remove storage util_npc:reference valid_trades
data modify storage util_npc:reference valid_trades set from storage util_npc:trade_validation trades
execute unless data storage util_npc:reference valid_trades[0] run return 0

# process trades
data modify storage util_npc:process_trades trades set from storage util_npc:trade_validation trades
function util_npc:trade/refresh/process_trades

# update hitbox
execute if data entity @s Offers.Recipes[0] on passengers run data modify entity @s {} merge from storage util_npc:trade_validation interaction_data.trading
