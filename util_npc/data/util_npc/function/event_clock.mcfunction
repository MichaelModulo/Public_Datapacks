
schedule function util_npc:event_clock 5s

execute as @e[type=interaction,tag=util_npc_core,tag=util_npc_unit,tag=util_npc_interaction,tag=util_npc_events_queued] at @s run function util_npc:event/process_activation
