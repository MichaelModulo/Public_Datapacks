
# convert marker
tag @s remove util_setup

# store block data in marker
data modify entity @s data.util_fake_blocks.BlockState.Name set from block ~ ~ ~ Items[{Slot:4b}].id

# refresh fake block
function util_fake_blocks:fake_block/refresh

# remove block
setblock ~ ~ ~ air replace
