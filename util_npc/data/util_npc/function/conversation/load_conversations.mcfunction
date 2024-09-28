
# reset loaded conversations
data remove storage util_npc:reference loaded_conversations
data remove storage util_npc:reference reserve_conversations

# load conversations
data modify storage util_npc:reference loaded_conversations append from storage util_npc:reference npc_data.conversations[{id:"util_npc:load"}]
execute if score #interaction_mode util_npc matches 1 run data modify storage util_npc:reference loaded_conversations append from storage util_npc:reference npc_data.conversations[{id:"util_npc:load/chat"}]
execute if score #interaction_mode util_npc matches 2 run data modify storage util_npc:reference loaded_conversations append from storage util_npc:reference npc_data.conversations[{id:"util_npc:load/attack"}]
execute if score #interaction_mode util_npc matches 3 run data modify storage util_npc:reference loaded_conversations append from storage util_npc:reference npc_data.conversations[{id:"util_npc:load/event"}]

# FUNCTION TAG
function #util_npc:load_conversations

# function tag
# <<< FUNCTION TAG >>>
