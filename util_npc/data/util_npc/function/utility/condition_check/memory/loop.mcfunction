
data modify storage util_npc:condition_check mem_check set from storage util_npc:condition_check mem_checks[0]

data remove storage util_npc:condition_check mem_check_macro
data modify storage util_npc:condition_check mem_check_macro set from storage util_npc:reference storage_keys
data modify storage util_npc:condition_check mem_check_macro merge from storage util_npc:condition_check mem_check
execute unless data storage util_npc:condition_check mem_check.npc run data modify storage util_npc:condition_check mem_check_macro.npc set from storage util_npc:reference storage_keys.npc_id
execute if data storage util_npc:condition_check mem_check{inverse:true} run data modify storage util_npc:condition_check mem_check_macro.if_unless set value "if"
execute unless data storage util_npc:condition_check mem_check{inverse:true} run data modify storage util_npc:condition_check mem_check_macro.if_unless set value "unless"
function util_npc:utility/condition_check/memory/macro with storage util_npc:condition_check mem_check_macro

data remove storage util_npc:condition_check mem_checks[0]
execute unless score #condition_check.condition_passed util_npc matches 0 if data storage util_npc:condition_check mem_checks[0] run function util_npc:utility/condition_check/memory/loop
