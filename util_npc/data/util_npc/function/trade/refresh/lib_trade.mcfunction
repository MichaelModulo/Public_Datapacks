
# set death loot table
data modify entity @s DeathLootTable set from storage util_npc:process_trades trade.trade.loot_table
data modify entity @s DeathLootTableSeed set value 1

# set trade data
data modify entity @s DecorItem.components."minecraft:custom_data".gm4_trades set from storage util_npc:process_trades trade.trade.trade_data

# bug fix alternative
function util_npc:trade/refresh/bug_fix with storage util_npc:process_trades trade

# set trade items
#loot replace entity @s horse.0 kill @s

# remove tag
tag @s remove gm4_new_trade_option
