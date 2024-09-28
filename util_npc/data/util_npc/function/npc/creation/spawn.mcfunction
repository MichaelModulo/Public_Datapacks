
# add macro data
data modify storage util_npc:macro spawn_npc.entity_id set from storage util_npc:setup npc.entity.type
execute if data storage util_npc:setup npc.entity{type:"util_npc:none"} run data modify storage util_npc:macro spawn_npc.entity_id set value "minecraft:block_display"
execute if data storage util_npc:setup npc run function util_npc:npc/creation/spawn_macro with storage util_npc:macro spawn_npc
execute unless data storage util_npc:setup npc run tellraw @a[gamemode=creative,distance=..15] ["",{"text":"[util_npc]","color":"gold"},{"text":" Spawn Failed: No setup data was given.","color":"red"}]

# reset storage for next npc
data remove storage util_npc:setup npc
