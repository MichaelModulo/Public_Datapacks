
scoreboard players reset @s colosseum.tp_booth
execute unless data storage colosseum:active timeslot{booth:"Any Booth"} unless data storage colosseum:active timeslot{booth:"Panel"} run function colosseum:utility/tp_current_booth/run