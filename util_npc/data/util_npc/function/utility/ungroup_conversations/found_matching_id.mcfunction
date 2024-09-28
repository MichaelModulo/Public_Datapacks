
# copy conversations
$data modify storage util_npc:ungroup_conversations new_conversations append from storage util_npc:reference npc_data.conversations[{id:"$(conversation_id)"}]
