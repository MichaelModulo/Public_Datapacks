
data modify storage util_npc:conversion_check macro.id set from storage util_npc:reference npc_data.entity.type
execute on passengers run data modify storage util_npc:conversion_check macro.name set from entity @s data.util_npc.save.conversion.name
function util_npc:npc/conversion/check with storage util_npc:conversion_check macro

execute if score #found_conversion util_npc matches 1 run function util_npc:npc/respawn
execute if score #found_conversion util_npc matches 2 run function util_npc:npc/despawn
