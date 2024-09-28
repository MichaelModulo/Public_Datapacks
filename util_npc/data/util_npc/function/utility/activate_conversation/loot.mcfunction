
$loot give @a[tag=util_npc_target_player,sort=nearest] loot $(loot_table)
execute as @a[tag=util_npc_target_player,sort=nearest] at @s run playsound minecraft:entity.item.pickup player @s ~ ~ ~ 0.5 2
