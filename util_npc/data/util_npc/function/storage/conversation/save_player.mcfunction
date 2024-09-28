
# save conversation
$execute if data storage util_npc:reference player_save.conversations[{id:"$(conversation_id)"}] run data modify storage util_npc:reference player_save.conversations[{id:"$(conversation_id)"}] set from storage util_npc:reference conversation_save
$execute unless data storage util_npc:reference player_save.conversations[{id:"$(conversation_id)"}] run data modify storage util_npc:reference player_save.conversations append from storage util_npc:reference conversation_save
