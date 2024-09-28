
$execute if data storage util_npc:activate_conversation set_memory_entry{keep:true} if data storage util_npc:activate_conversation set_memory_entry{save:"npc"} if data storage util_npc:reference npc_save.memory.$(path) run return 0
$execute if data storage util_npc:activate_conversation set_memory_entry{keep:true} unless data storage util_npc:activate_conversation set_memory_entry{save:"npc"} if data storage util_npc:reference player_save.memory.$(path) run return 0

$execute if data storage util_npc:activate_conversation set_memory_entry{save:"npc"} unless data storage util_npc:activate_conversation set_memory_entry{append:true} run data modify storage util_npc:reference npc_save.memory.$(path) set value $(value)
$execute unless data storage util_npc:activate_conversation set_memory_entry{save:"npc"} unless data storage util_npc:activate_conversation set_memory_entry{append:true} run data modify storage util_npc:reference player_save.memory.$(path) set value $(value)
$execute if data storage util_npc:activate_conversation set_memory_entry{save:"npc"} if data storage util_npc:activate_conversation set_memory_entry{append:true} run data modify storage util_npc:reference npc_save.memory.$(path) append value $(value)
$execute unless data storage util_npc:activate_conversation set_memory_entry{save:"npc"} if data storage util_npc:activate_conversation set_memory_entry{append:true} run data modify storage util_npc:reference player_save.memory.$(path) append value $(value)
