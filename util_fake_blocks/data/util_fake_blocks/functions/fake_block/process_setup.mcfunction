
# kill if broken
execute unless block ~ ~ ~ dropper run kill @s

# convert to fake block
execute if data block ~ ~ ~ Items[{Slot:4b}] run function util_fake_blocks:fake_block/create
