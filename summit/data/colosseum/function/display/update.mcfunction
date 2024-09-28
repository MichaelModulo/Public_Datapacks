
scoreboard players operation #minutes colosseum = $time_left colosseum
scoreboard players operation #minutes colosseum /= #60 colosseum
scoreboard players operation #seconds colosseum = $time_left colosseum
scoreboard players operation #seconds colosseum %= #60 colosseum

data modify storage colosseum:display macro.current set from storage colosseum:active timeslot.booth
data modify storage colosseum:display macro.next set from storage colosseum:active timeslots[0].booth
execute store result storage colosseum:display macro.minutes int 1 run scoreboard players get #minutes colosseum
execute store result storage colosseum:display macro.seconds int 1 run scoreboard players get #seconds colosseum

execute if score #timeslots colosseum matches ..1 as @e[type=text_display,tag=summit_colosseum_display] at @s run function colosseum:display/set_text/any_booth with storage colosseum:display macro
execute if score #timeslots colosseum matches 2.. as @e[type=text_display,tag=summit_colosseum_display] at @s run function colosseum:display/set_text/booth with storage colosseum:display macro
execute if data storage colosseum:active timeslot{mode:"panel"} as @e[type=text_display,tag=summit_colosseum_display] at @s run function colosseum:display/set_text/panel
