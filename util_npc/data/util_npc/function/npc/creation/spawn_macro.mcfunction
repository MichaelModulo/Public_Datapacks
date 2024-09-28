
# summon the correct entity 
scoreboard players set #entity_spawned util_npc 0
execute if score #entity_spawned util_npc matches 0 store result score #entity_spawned util_npc if data storage util_npc:setup npc.entity{type:"util_npc:none"} run summon block_display ~ ~ ~ {Tags:["util_npc_unit","util_npc_entity"],Passengers:[{id:"minecraft:interaction",width:1f,height:1f,response:1b,Tags:["util_npc_setup","util_npc_unit","util_npc_core","util_npc_interaction","util_npc_no_entity"],Passengers:[{id:"minecraft:marker",Tags:["util_npc_unit","util_npc_marker"],data:{util_npc:{}}}]}]}
$execute if score #entity_spawned util_npc matches 0 store result score #entity_spawned util_npc unless data storage util_npc:setup npc.entity{type:"util_npc:none"} run summon $(entity_id) ~ ~ ~ {PersistenceRequired:1b,Tags:["util_npc_unit","util_npc_entity"],Passengers:[{id:"minecraft:interaction",width:1f,height:1f,response:1b,Tags:["util_npc_setup","util_npc_unit","util_npc_core","util_npc_interaction"],Passengers:[{id:"minecraft:marker",Tags:["util_npc_unit","util_npc_marker"],data:{util_npc:{}}}]}]}

# execute as new npc to store data
execute as @e[type=interaction,tag=util_npc_setup] at @s run function util_npc:npc/creation/new
