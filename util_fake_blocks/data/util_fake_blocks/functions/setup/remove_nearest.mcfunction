
# kill
execute as @e[type=marker,tag=util_fake_block_marker,sort=nearest,limit=1,distance=..5] at @s run function util_fake_blocks:fake_block/remove

# remove command block
fill ~ ~ ~ ~ ~ ~ air replace command_block
