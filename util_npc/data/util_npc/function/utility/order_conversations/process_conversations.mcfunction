
# set target
data modify storage util_npc:order_conversations conversation set from storage util_npc:order_conversations conversations[0]

# default values
execute unless data storage util_npc:order_conversations conversation.order run data modify storage util_npc:order_conversations conversation.order set value "queue"
execute unless data storage util_npc:order_conversations conversation{order:"queue"}.priority run data modify storage util_npc:order_conversations conversation.priority set value "low"

# rebuild array
scoreboard players set #order_conversations.priority_matched util_npc 0
execute if score #order_conversations.priority_target util_npc matches 1 store success score #order_conversations.priority_matched util_npc if data storage util_npc:order_conversations conversation{order:"queue",priority:"high"} run data modify storage util_npc:order_conversations new_conversations append from storage util_npc:order_conversations conversation
execute if score #order_conversations.priority_target util_npc matches 2 store success score #order_conversations.priority_matched util_npc if data storage util_npc:order_conversations conversation{order:"queue",priority:"medium"} run data modify storage util_npc:order_conversations new_conversations append from storage util_npc:order_conversations conversation
execute if score #order_conversations.priority_target util_npc matches 3 store success score #order_conversations.priority_matched util_npc if data storage util_npc:order_conversations conversation{order:"queue",priority:"low"} run data modify storage util_npc:order_conversations new_conversations append from storage util_npc:order_conversations conversation
execute if score #order_conversations.priority_target util_npc matches 4 store success score #order_conversations.priority_matched util_npc if data storage util_npc:order_conversations conversation{order:"random"} run data modify storage util_npc:order_conversations new_conversations append from storage util_npc:order_conversations conversation
execute if score #order_conversations.priority_matched util_npc matches 0 run data modify storage util_npc:order_conversations extra_conversations append from storage util_npc:order_conversations conversation

# [DEBUG]
execute if score #order_conversations.priority_matched util_npc matches 1 if data storage util_npc:order_conversations conversation{order:"queue",priority:"high"} run data modify storage util_npc:order_conversations debug append value "1"
execute if score #order_conversations.priority_matched util_npc matches 1 if data storage util_npc:order_conversations conversation{order:"queue",priority:"medium"} run data modify storage util_npc:order_conversations debug append value "2"
execute if score #order_conversations.priority_matched util_npc matches 1 if data storage util_npc:order_conversations conversation{order:"queue",priority:"low"} run data modify storage util_npc:order_conversations debug append value "3"
execute if score #order_conversations.priority_matched util_npc matches 1 if data storage util_npc:order_conversations conversation{order:"random"} run data modify storage util_npc:order_conversations debug append value "R"

# loop
data remove storage util_npc:order_conversations conversations[0]
execute if data storage util_npc:order_conversations conversations[0] run function util_npc:utility/order_conversations/process_conversations
