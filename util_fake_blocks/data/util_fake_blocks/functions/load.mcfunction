execute if score gm4 load.status matches 1 run scoreboard players set util_fake_blocks load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Utility - Fake Blocks",require:"Gamemode 4"}

execute if score util_fake_blocks load.status matches 1 run function util_fake_blocks:init
execute unless score util_fake_blocks load.status matches 1 run schedule clear util_fake_blocks:main
execute unless score util_fake_blocks load.status matches 1 run schedule clear util_fake_blocks:slow_clock
