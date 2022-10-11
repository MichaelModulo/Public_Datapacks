forceload add 7395674 946558

execute unless score util_fake_blocks gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Utility - Fake Blocks"}
scoreboard players set util_fake_blocks gm4_modules 1

schedule function util_fake_blocks:main 1t
schedule function util_fake_blocks:slow_clock 2t

#$moduleUpdateList
