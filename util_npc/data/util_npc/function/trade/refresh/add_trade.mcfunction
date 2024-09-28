
# direct trade
execute if data storage util_npc:process_trades trade{method:"direct"} run data modify entity @s Offers.Recipes append from storage util_npc:process_trades trade.trade

# lib_trades trade
execute if data storage util_npc:process_trades trade{method:"lib_trades"} run summon trader_llama ~ -65 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_new_trade_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",count:1,tag:{gm4_trades:{pool:"ps_npc:sample_1",options:{maxUses:999999999,rewardXp:0b,xp:0,priceMultiplier:0.00f}}}}}
execute if data storage util_npc:process_trades trade{method:"lib_trades"} as @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] run function util_npc:trade/refresh/lib_trade
