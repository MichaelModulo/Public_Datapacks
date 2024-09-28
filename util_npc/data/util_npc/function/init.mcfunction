scoreboard objectives add util_npc dummy

scoreboard players set #100 util_npc 100

execute unless score util_npc gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"NPC Utilities"}
scoreboard players set util_npc gm4_modules 1

schedule function util_npc:main 1t
schedule function util_npc:npc_clock 2t
schedule function util_npc:event_clock 3t
