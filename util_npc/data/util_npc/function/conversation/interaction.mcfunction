
# load conversations
function util_npc:conversation/load_conversations
execute unless data storage util_npc:reference loaded_conversations[0] run return 0

# FUNCTION TAG
function #util_npc:interaction

# validate conversations
data remove storage util_npc:reference ungrouped_conversations
data remove storage util_npc:reference valid_conversations
data modify storage util_npc:conversation_validation conversations set from storage util_npc:reference loaded_conversations

# ungroup conversations
function util_npc:utility/ungroup_conversations/run {input_storage:"util_npc:conversation_validation conversations",output_storage:"util_npc:conversation_validation conversations"}
execute unless data storage util_npc:conversation_validation conversations[0] run return 0
data modify storage util_npc:reference ungrouped_conversations set from storage util_npc:conversation_validation conversations

# check conversations
function util_npc:utility/check_conversations/run {input_storage:"util_npc:conversation_validation conversations",input_score:"#interaction_mode util_npc",output_storage:"util_npc:conversation_validation conversations"}
execute unless data storage util_npc:conversation_validation conversations[0] run return 0

# order conversations
function util_npc:utility/order_conversations/run {input_storage:"util_npc:conversation_validation conversations",output_storage:"util_npc:conversation_validation conversations"}
execute unless data storage util_npc:conversation_validation conversations[0] run return 0
data modify storage util_npc:reference valid_conversations set from storage util_npc:conversation_validation conversations

# choose conversation
function util_npc:utility/choose_conversation/run {input_storage:"util_npc:conversation_validation conversations",output_storage:"util_npc:reference chosen_conversation"}
execute unless data storage util_npc:reference chosen_conversation run return 0

# activate conversation
function util_npc:utility/activate_conversation/run {input_storage:"util_npc:reference chosen_conversation"}

# FUNCTION TAG
function #util_npc:interaction_post
