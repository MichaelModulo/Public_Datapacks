schedule function util_fake_blocks:slow_clock 1200t

# refresh fake blocks
execute as @e[type=marker,tag=util_fake_block_marker,tag=!util_setup] at @s run function util_fake_blocks:fake_block/refresh
