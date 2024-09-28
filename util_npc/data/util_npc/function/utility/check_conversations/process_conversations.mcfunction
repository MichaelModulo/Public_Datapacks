
# set target
data modify storage util_npc:check_conversations conversation set from storage util_npc:check_conversations conversations[0]

# reset check
scoreboard players set #check_conversations.valid_conversation util_npc 1

# type check
execute if score #check_conversations.conversation_type util_npc matches 1 unless data storage util_npc:check_conversations conversation{type:"chat"} run data modify storage util_npc:check_conversations debug append value "T"
execute if score #check_conversations.conversation_type util_npc matches 1 unless data storage util_npc:check_conversations conversation{type:"chat"} run scoreboard players set #check_conversations.valid_conversation util_npc 0
execute if score #check_conversations.conversation_type util_npc matches 2 unless data storage util_npc:check_conversations conversation{type:"attack"} run data modify storage util_npc:check_conversations debug append value "T"
execute if score #check_conversations.conversation_type util_npc matches 2 unless data storage util_npc:check_conversations conversation{type:"attack"} run scoreboard players set #check_conversations.valid_conversation util_npc 0
execute if score #check_conversations.conversation_type util_npc matches 3 unless data storage util_npc:check_conversations conversation{type:"event"} run data modify storage util_npc:check_conversations debug append value "T"
execute if score #check_conversations.conversation_type util_npc matches 3 unless data storage util_npc:check_conversations conversation{type:"event"} run scoreboard players set #check_conversations.valid_conversation util_npc 0

# condition check (conversation)
function util_npc:utility/condition_check/run {input_storage:"util_npc:check_conversations conversation.conditions",output_score:"#check_conversations.condition_passed_conv util_npc"}
execute unless score #check_conversations.condition_passed_conv util_npc matches 1 if score #check_conversations.valid_conversation util_npc matches 1 run data modify storage util_npc:check_conversations debug append value "C"
execute unless score #check_conversations.condition_passed_conv util_npc matches 1 run scoreboard players set #check_conversations.valid_conversation util_npc 0

# condition check (lines)
data modify storage util_npc:check_conversations dialogue_lines set from storage util_npc:check_conversations conversation.dialogue
function util_npc:utility/check_conversations/process_dialogue
execute unless score #check_conversations.condition_passed_dial util_npc matches 1 if score #check_conversations.valid_conversation util_npc matches 1 run data modify storage util_npc:check_conversations debug append value "c"
execute unless score #check_conversations.condition_passed_dial util_npc matches 1 run scoreboard players set #check_conversations.valid_conversation util_npc 0

# event check
scoreboard players set #check_conversations.event_matched util_npc 1
execute if score #check_conversations.conversation_type util_npc matches 3 run function util_npc:utility/check_conversations/check_event with storage util_npc:reference event_active
execute unless score #check_conversations.event_matched util_npc matches 1 if score #check_conversations.valid_conversation util_npc matches 1 run data modify storage util_npc:check_conversations debug append value "E"
execute unless score #check_conversations.event_matched util_npc matches 1 run scoreboard players set #check_conversations.valid_conversation util_npc 0

# progress check
execute if data storage util_npc:check_conversations conversation{mode:"linear"} run function util_npc:utility/check_conversations/load_progress
execute if data storage util_npc:check_conversations conversation{mode:"linear"} run execute unless score #check_conversations.progress_value util_npc < #check_conversations.progress_max util_npc if score #check_conversations.valid_conversation util_npc matches 1 run data modify storage util_npc:check_conversations debug append value "P"
execute if data storage util_npc:check_conversations conversation{mode:"linear"} run execute unless score #check_conversations.progress_value util_npc < #check_conversations.progress_max util_npc run scoreboard players set #check_conversations.valid_conversation util_npc 0

# rebuild array
execute if score #check_conversations.valid_conversation util_npc matches 1 run tellraw @a[distance=..10,tag=util_npc_debug_check_conversations] [{"text":"[Debug] Valid (","color":"yellow"},{"nbt":"conversation.id","storage":"util_npc:check_conversations","color":"gold"},{"text":")","color":"yellow"}]
execute if score #check_conversations.valid_conversation util_npc matches 1 if score #check_conversations.valid_conversation util_npc matches 1 run data modify storage util_npc:check_conversations debug append value "✔"
execute if score #check_conversations.valid_conversation util_npc matches 1 run data modify storage util_npc:check_conversations new_conversations append from storage util_npc:check_conversations conversation

# loop
data remove storage util_npc:check_conversations conversations[0]
execute if data storage util_npc:check_conversations conversations[0] run function util_npc:utility/check_conversations/process_conversations
