
# remove tag
tag @s remove util_new

# store data
data modify entity @s BlockState set from storage util_fake_block:reference BlockState

# move
tp @s ~ ~-.5 ~
