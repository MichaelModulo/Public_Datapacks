
data modify storage util_npc:activate_conversation set_memory_entry set from storage util_npc:activate_conversation set_memory_entries[0]
data remove storage util_npc:activate_conversation set_memory_entries[0]

data remove storage util_npc:set_memory macro
data modify storage util_npc:set_memory macro set from storage util_npc:activate_conversation set_memory_entry
function util_npc:utility/activate_conversation/set_memory/macro with storage util_npc:set_memory macro

execute if data storage util_npc:activate_conversation set_memory_entries[0] run function util_npc:utility/activate_conversation/set_memory/loop
