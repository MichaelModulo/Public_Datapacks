
# save to memory
data modify storage util_npc:continue_conversation/save continue_data.type set from storage util_npc:continue_conversation/save conversation.type
data modify storage util_npc:continue_conversation/save continue_data.id set from storage util_npc:continue_conversation/save conversation.continuation.forward
data remove storage util_npc:continue_conversation/save continue_data.expiration
