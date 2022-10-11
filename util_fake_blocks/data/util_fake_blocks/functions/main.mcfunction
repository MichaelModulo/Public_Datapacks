schedule function util_fake_blocks:main 16t

# process fake block setups
execute as @e[type=marker,tag=util_fake_block_marker,tag=util_setup] at @s run function util_fake_blocks:fake_block/process_setup
