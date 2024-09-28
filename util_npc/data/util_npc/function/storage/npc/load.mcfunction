
# new npc entry
$execute unless data storage util_npc:reference npc_database[{id:"$(npc_id)"}] run data modify storage util_npc:reference npc_database append value {id:"$(npc_id)",players:[],memory:{}}

# load npc
$data modify storage util_npc:reference npc_save set from storage util_npc:reference npc_database[{id:"$(npc_id)"}]
