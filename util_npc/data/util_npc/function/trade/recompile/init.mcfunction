
# get list of trades
data remove storage util_npc:recompile_trades trades
execute on passengers run data modify storage util_npc:recompile_trades trades set from entity @s data.util_npc.trades

# compile trades
data remove storage util_npc:reference npc_save.memory.compiled_trades
execute if data storage util_npc:recompile_trades trades[0] run function util_npc:trade/recompile/process_trades
