
data remove storage colosseum:process new_items

data modify storage colosseum:process items set from storage colosseum:return database.inventory
function colosseum:utility/return_items/loop

item replace block -157 0 -28 container.0 with emerald[custom_name='{"color":"dark_red","italic":false,"text":"Colosseum Technical Item"}',lore=['{"color":"yellow","italic":false,"text":"You should not have this,"}','{"color":"yellow","italic":false,"text":"please let MichaelModulo know."}']] 1

# hotbar

execute if data storage colosseum:process new_items[{i:0}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:0}]
execute if data storage colosseum:process new_items[{i:0}] run item replace entity @s hotbar.0 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:1}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:1}]
execute if data storage colosseum:process new_items[{i:1}] run item replace entity @s hotbar.1 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:2}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:2}]
execute if data storage colosseum:process new_items[{i:2}] run item replace entity @s hotbar.2 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:3}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:3}]
execute if data storage colosseum:process new_items[{i:3}] run item replace entity @s hotbar.3 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:4}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:4}]
execute if data storage colosseum:process new_items[{i:4}] run item replace entity @s hotbar.4 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:5}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:5}]
execute if data storage colosseum:process new_items[{i:5}] run item replace entity @s hotbar.5 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:6}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:6}]
execute if data storage colosseum:process new_items[{i:6}] run item replace entity @s hotbar.6 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:7}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:7}]
execute if data storage colosseum:process new_items[{i:7}] run item replace entity @s hotbar.7 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:8}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:8}]
execute if data storage colosseum:process new_items[{i:8}] run item replace entity @s hotbar.8 from block -157 0 -28 container.0

# inventory

execute if data storage colosseum:process new_items[{i:9}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:9}]
execute if data storage colosseum:process new_items[{i:9}] run item replace entity @s inventory.0 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:10}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:10}]
execute if data storage colosseum:process new_items[{i:10}] run item replace entity @s inventory.1 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:11}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:11}]
execute if data storage colosseum:process new_items[{i:11}] run item replace entity @s inventory.2 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:12}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:12}]
execute if data storage colosseum:process new_items[{i:12}] run item replace entity @s inventory.3 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:13}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:13}]
execute if data storage colosseum:process new_items[{i:13}] run item replace entity @s inventory.4 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:14}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:14}]
execute if data storage colosseum:process new_items[{i:14}] run item replace entity @s inventory.5 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:15}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:15}]
execute if data storage colosseum:process new_items[{i:15}] run item replace entity @s inventory.6 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:16}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:16}]
execute if data storage colosseum:process new_items[{i:16}] run item replace entity @s inventory.7 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:17}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:17}]
execute if data storage colosseum:process new_items[{i:17}] run item replace entity @s inventory.8 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:18}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:18}]
execute if data storage colosseum:process new_items[{i:18}] run item replace entity @s inventory.9 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:19}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:19}]
execute if data storage colosseum:process new_items[{i:19}] run item replace entity @s inventory.10 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:20}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:20}]
execute if data storage colosseum:process new_items[{i:20}] run item replace entity @s inventory.11 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:21}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:21}]
execute if data storage colosseum:process new_items[{i:21}] run item replace entity @s inventory.12 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:22}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:22}]
execute if data storage colosseum:process new_items[{i:22}] run item replace entity @s inventory.13 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:23}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:23}]
execute if data storage colosseum:process new_items[{i:23}] run item replace entity @s inventory.14 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:24}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:24}]
execute if data storage colosseum:process new_items[{i:24}] run item replace entity @s inventory.15 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:25}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:25}]
execute if data storage colosseum:process new_items[{i:25}] run item replace entity @s inventory.16 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:26}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:26}]
execute if data storage colosseum:process new_items[{i:26}] run item replace entity @s inventory.17 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:27}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:27}]
execute if data storage colosseum:process new_items[{i:27}] run item replace entity @s inventory.18 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:28}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:28}]
execute if data storage colosseum:process new_items[{i:28}] run item replace entity @s inventory.19 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:29}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:29}]
execute if data storage colosseum:process new_items[{i:29}] run item replace entity @s inventory.20 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:30}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:30}]
execute if data storage colosseum:process new_items[{i:30}] run item replace entity @s inventory.21 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:31}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:31}]
execute if data storage colosseum:process new_items[{i:31}] run item replace entity @s inventory.22 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:32}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:32}]
execute if data storage colosseum:process new_items[{i:32}] run item replace entity @s inventory.23 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:33}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:33}]
execute if data storage colosseum:process new_items[{i:33}] run item replace entity @s inventory.24 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:34}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:34}]
execute if data storage colosseum:process new_items[{i:34}] run item replace entity @s inventory.25 from block -157 0 -28 container.0

# armor

execute if data storage colosseum:process new_items[{i:35}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:35}]
execute if data storage colosseum:process new_items[{i:35}] run item replace entity @s inventory.26 from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:100}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:100}]
execute if data storage colosseum:process new_items[{i:100}] run item replace entity @s armor.feet from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:101}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:101}]
execute if data storage colosseum:process new_items[{i:101}] run item replace entity @s armor.legs from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:102}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:102}]
execute if data storage colosseum:process new_items[{i:102}] run item replace entity @s armor.chest from block -157 0 -28 container.0

execute if data storage colosseum:process new_items[{i:103}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:103}]
execute if data storage colosseum:process new_items[{i:103}] run item replace entity @s armor.head from block -157 0 -28 container.0

# offhand

execute if data storage colosseum:process new_items[{i:-106}] run data modify block -157 0 -28 Items[0] set from storage colosseum:process new_items[{i:-106}]
execute if data storage colosseum:process new_items[{i:-106}] run item replace entity @s weapon.offhand from block -157 0 -28 container.0
