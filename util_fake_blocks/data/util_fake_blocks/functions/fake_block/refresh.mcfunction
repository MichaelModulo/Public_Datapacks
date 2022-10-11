
# store marker data
data modify storage util_fake_block:reference BlockState set from entity @s data.util_fake_blocks.BlockState

# spawn fake block
summon falling_block 7395674 ~ 946558 {BlockState:{Name:"minecraft:red_concrete"},TileEntityData:{},NoGravity:1b,Silent:1b,Time:-620,DropItem:0b,HurtEntities:0b,Tags:["util_fake_block","util_new"]}

# update fake block data
execute as @e[type=falling_block,tag=util_fake_block,tag=util_new] run function util_fake_blocks:fake_block/store_data
