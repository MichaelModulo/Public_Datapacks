
schedule function util_npc:npc_clock 3s

function #util_npc:pre_process

execute as @e[type=interaction,tag=util_npc_core,tag=util_npc_unit,tag=util_npc_interaction] at @s run function util_npc:npc/process
