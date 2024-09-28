
# ===== INITIALIZE =====

# add tag
tag @a[tag=util_npc_target_player] add util_npc_listening_player
execute if data storage util_npc:activate_conversation conversation{broadcast:true} unless data storage util_npc:activate_conversation conversation{type:"event"} run tag @a[distance=..15] add util_npc_listening_player

# counter settings override
execute if data storage util_npc:activate_conversation conversation{counter:true} unless data storage util_npc:activate_conversation line.counter run data modify storage util_npc:activate_conversation line.counter set value true



# ===== MESSAGE =====

# counter message (mode vs disabled)
data modify storage util_npc:activate_conversation counter_message set value '[{"text":"{","color":"gray"},{"score":{"name":"#activate_conversation.counter_value","objective":"util_npc","color":"gray"}},{"text":"/","color":"gray"},{"score":{"name":"#dialogue_progress_max","objective":"util_npc","color":"gray"}},{"text":"} ","color":"gray"}]'
execute if data storage util_npc:activate_conversation conversation{mode:"linear"} run data modify storage util_npc:activate_conversation counter_message set value '[{"text":"[","color":"gray"},{"score":{"name":"#activate_conversation.counter_value","objective":"util_npc","color":"gray"}},{"text":"/","color":"gray"},{"score":{"name":"#dialogue_progress_max","objective":"util_npc","color":"gray"}},{"text":"] ","color":"gray"}]'
execute if data storage util_npc:activate_conversation conversation{mode:"looping"} run data modify storage util_npc:activate_conversation counter_message set value '[{"text":"(","color":"gray"},{"score":{"name":"#activate_conversation.counter_value","objective":"util_npc","color":"gray"}},{"text":"/","color":"gray"},{"score":{"name":"#dialogue_progress_max","objective":"util_npc","color":"gray"}},{"text":") ","color":"gray"}]'
execute unless data storage util_npc:activate_conversation conversation{counter:true} run data modify storage util_npc:activate_conversation counter_message set value '[{"text":""}]'

# name message (conversation vs line)
#data modify storage util_npc:activate_conversation name_message set value '[{"text":"<","color":"white"},{"nbt":"npc_data.name","storage":"util_npc:reference","interpret":true},{"text":"> ","color":"white"}]'
#execute if data storage util_npc:activate_conversation line.name run data modify storage util_npc:activate_conversation name_message set value '[{"text":"<","color":"white"},{"nbt":"line.name","storage":"util_npc:activate_conversation","interpret":true},{"text":"> ","color":"white"}]'
data modify storage util_npc:activate_conversation name_message set value '["",{"text":"\\u0004 ","color":"white","font":"props:team_logos"},{"nbt":"npc_data.name","storage":"util_npc:reference","interpret":true},{"text":" » ","color":"#8C8986"}]'
execute if data storage util_npc:activate_conversation line.name run data modify storage util_npc:activate_conversation name_message set value '["",{"text":"\\u0004 ","color":"white","font":"props:team_logos"},{"nbt":"line.name","storage":"util_npc:activate_conversation","interpret":true},{"text":" » ","color":"#8C8986"}]'
execute if data storage util_npc:activate_conversation line{name:false} run data modify storage util_npc:activate_conversation name_message set value ""

# icon message
data modify storage util_npc:activate_conversation icon_message set value ""
execute if data storage util_npc:activate_conversation conversation.icon run data modify storage util_npc:activate_conversation icon_message set value '[{"nbt":"conversation.icon","storage":"util_npc:activate_conversation","interpret":true}," "]'
execute if data storage util_npc:activate_conversation line.icon run data modify storage util_npc:activate_conversation icon_message set value '[{"nbt":"line.icon","storage":"util_npc:activate_conversation","interpret":true}," "]'


# ===== MISC =====

# loot reward
data modify storage util_npc:macro speak_loot.loot_table set from storage util_npc:activate_conversation line.loot
execute if data storage util_npc:activate_conversation line.loot run function util_npc:utility/activate_conversation/loot with storage util_npc:macro speak_loot

# run command
data modify storage util_npc:macro speak_run_command.command set from storage util_npc:activate_conversation line.run_command
execute if data storage util_npc:activate_conversation line.run_command run function util_npc:utility/activate_conversation/run_command with storage util_npc:macro speak_run_command

# set memory
execute if data storage util_npc:activate_conversation line.set_memory run function util_npc:utility/activate_conversation/set_memory/init

# refresh trades
execute if data storage util_npc:activate_conversation line{refresh_trades:true} on vehicle run function util_npc:trade/refresh/init



# ===== VISUALS / AUDIO =====

# audio
data modify storage util_npc:macro speak_audio.selector set value "@s"
data modify storage util_npc:macro speak_audio.location set value "~ ~ ~"
data modify storage util_npc:macro speak_audio merge from storage util_npc:activate_conversation line.audio
execute if data storage util_npc:activate_conversation line.audio run function util_npc:utility/activate_conversation/audio with storage util_npc:macro speak_audio

# display text
execute if score #activate_conversation.counter_value util_npc matches 1 if data storage util_npc:activate_conversation conversation.header.top run tellraw @a[tag=util_npc_listening_player] [{"nbt":"conversation.header.top","storage":"util_npc:activate_conversation","interpret":true}]
execute unless data storage util_npc:activate_conversation line{message:'""'} run tellraw @a[tag=util_npc_listening_player] [{"nbt":"name_message","storage":"util_npc:activate_conversation","interpret":true},{"nbt":"icon_message","storage":"util_npc:activate_conversation","interpret":true},{"nbt":"counter_message","storage":"util_npc:activate_conversation","interpret":true},{"nbt":"line.message","storage":"util_npc:activate_conversation","interpret":true}]
execute if score #activate_conversation.counter_value util_npc >= #dialogue_progress_max util_npc if data storage util_npc:activate_conversation conversation.header.bottom run tellraw @a[tag=util_npc_listening_player] [{"nbt":"conversation.header.bottom","storage":"util_npc:activate_conversation","interpret":true}]


# ===== FINALIZE =====

# remove tag
tag @a remove util_npc_listening_player
