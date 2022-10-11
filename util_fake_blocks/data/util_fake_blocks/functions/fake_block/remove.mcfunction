
# kill
kill @s
execute align y run kill @e[type=falling_block,tag=util_fake_block,sort=nearest,distance=..0.2]

# block
fill ~ ~ ~ ~ ~ ~ air replace dropper{CustomName:'{"color":"red","text":"Fake Block Setup"}'}
