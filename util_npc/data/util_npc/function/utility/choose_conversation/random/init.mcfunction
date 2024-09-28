
# randomly pick an option
execute store result score #choose_conversation.conversation_left util_npc run data get storage util_npc:choose_conversation conversations
execute store result score #choose_conversation.chosen_conversation util_npc run time query gametime
scoreboard players operation #choose_conversation.chosen_conversation util_npc %= #choose_conversation.conversation_left util_npc

# choose conversation
execute store result storage util_npc:macro check_conversation_index.index int 1 run scoreboard players get #choose_conversation.chosen_conversation util_npc
function util_npc:utility/choose_conversation/random/macro with storage util_npc:macro check_conversation_index
