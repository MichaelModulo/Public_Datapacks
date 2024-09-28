
$execute if data storage util_npc:condition_check mem_check{save:"npc"} $(if_unless) data storage util_npc:reference npc_database[{id:"$(npc)"}].memory.$(path) run scoreboard players set #condition_check.condition_passed util_npc 0
$execute unless data storage util_npc:condition_check mem_check{save:"npc"} $(if_unless) data storage util_npc:reference npc_database[{id:"$(npc)"}].players[{UUID:"$(player_uuid)"}].memory.$(path) run scoreboard players set #condition_check.condition_passed util_npc 0
