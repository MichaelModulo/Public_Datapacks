scoreboard players set util_npc load.status 1

execute if score util_npc load.status matches 1 run function util_npc:init
execute unless score util_npc load.status matches 1 run schedule clear util_npc:main
execute unless score util_npc load.status matches 1 run schedule clear util_npc:npc_clock
execute unless score util_npc load.status matches 1 run schedule clear util_npc:event_clock
