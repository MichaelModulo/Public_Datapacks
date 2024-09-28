
data modify storage util_npc:ungroup_trades debug append value " "

scoreboard players set #ungroup_trades.ungrouped_conversation util_npc 0
data modify storage util_npc:ungroup_trades trades set from storage util_npc:ungroup_trades new_trades
data remove storage util_npc:ungroup_trades new_trades
function util_npc:utility/ungroup_trades/process_trades
