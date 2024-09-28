
# set target
data modify storage util_npc:process_trades trade set from storage util_npc:process_trades trades[0]
data remove storage util_npc:process_trades trades[0]

# add trade
function util_npc:trade/refresh/add_trade

# modify trader
execute if data storage util_npc:process_trades trade.trade{register:true} run function #gm4_trades:modify_external_trader

# loop
execute if data storage util_npc:process_trades trades[0] run function util_npc:trade/refresh/process_trades
