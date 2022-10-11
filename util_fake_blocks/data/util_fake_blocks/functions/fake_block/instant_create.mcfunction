
# convert marker
tag @s remove util_setup

# store block data in marker
data modify entity @s data.util_fake_blocks.BlockState.Name set from entity @a[limit=1,sort=nearest,gamemode=creative,distance=..10,nbt={SelectedItem:{tag:{util_fake_blocks:{action:"setup"}}},Inventory:[{Slot:-106b}]}] Inventory[{Slot:-106b}].id

# refresh fake block
function util_fake_blocks:fake_block/refresh

# remove block
setblock ~ ~ ~ air replace