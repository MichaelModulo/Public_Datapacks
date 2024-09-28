
# set target
data modify storage util_npc:recompile_trades trade set from storage util_npc:recompile_trades trades[0]
data remove storage util_npc:recompile_trades trades[0]

# generate trade
function util_npc:trade/recompile/generate_trade

# loop
execute if data storage util_npc:recompile_trades trades[0] run function util_npc:trade/recompile/process_trades
