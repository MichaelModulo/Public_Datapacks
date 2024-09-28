
# reset if flagged
$data remove storage util_npc:reference npc_save.conversations[{id:"$(conversation_id)",status:"reset"}]

# set conversation data
data modify storage util_npc:load_conversation conversation set from storage util_npc:load_conversation macro.conversation

# load conversation
data remove storage util_npc:reference conversation_save
$data modify storage util_npc:reference conversation_save set from storage util_npc:reference npc_save.conversations[{id:"$(conversation_id)"}]

# new conversation entry
$execute unless data storage util_npc:reference npc_save.conversations[{id:"$(conversation_id)"}] if data storage util_npc:load_conversation conversation{mode:"linear"} run data modify storage util_npc:reference conversation_save set value {id:"$(conversation_id)",value:0,status:"incomplete"}
$execute unless data storage util_npc:reference npc_save.conversations[{id:"$(conversation_id)"}] if data storage util_npc:load_conversation conversation{mode:"looping"} run data modify storage util_npc:reference conversation_save set value {id:"$(conversation_id)",value:0}
$execute unless data storage util_npc:reference npc_save.conversations[{id:"$(conversation_id)"}] if data storage util_npc:load_conversation conversation{mode:"random"} run data modify storage util_npc:reference conversation_save set value {id:"$(conversation_id)"}
$execute unless data storage util_npc:reference npc_save.conversations[{id:"$(conversation_id)"}] if data storage util_npc:load_conversation conversation{mode:"first_valid"} run data modify storage util_npc:reference conversation_save set value {id:"$(conversation_id)"}
