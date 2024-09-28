
# new player entry
$execute unless data storage util_npc:reference npc_save.players[{UUID:"$(player_uuid)"}] run data modify storage util_npc:debug path append value "[NewPLR] "
$execute unless data storage util_npc:reference npc_save.players[{UUID:"$(player_uuid)"}] run data modify storage util_npc:reference npc_save.players append value {Name:"$(player_name)",UUID:"$(player_uuid)",progress:[],memory:{interaction_delay:-1}}

# load player
$data modify storage util_npc:reference player_save set from storage util_npc:reference npc_save.players[{UUID:"$(player_uuid)"}]
