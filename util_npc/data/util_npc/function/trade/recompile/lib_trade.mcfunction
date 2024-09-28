
# set death loot table
data modify entity @s DeathLootTable set from storage util_npc:recompile_trades trade.trade.loot_table

# set trade items
loot replace entity @s horse.0 kill @s

# store
data remove storage util_npc:recompile_trades new_trade
data modify storage util_npc:recompile_trades new_trade.items set from entity @s Items
data modify storage util_npc:recompile_trades new_trade.id set from storage util_npc:recompile_trades trade.id
execute if data storage util_npc:recompile_trades new_trade run data modify storage util_npc:reference npc_save.memory.compiled_trades append from storage util_npc:recompile_trades new_trade

# kill
tag @s remove gm4_new_trade_option
data modify entity @s DeathLootTable set value ""
kill @s
