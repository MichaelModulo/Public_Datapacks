
$execute unless data storage colosseum:active timeslot{booth:"Any Booth"} unless data storage colosseum:active timeslot{booth:"Panel"} run tellraw @a [{"text":"[Summit] ","color":"aqua"},{"text":"The colosseum is active for ","color":"white"},{"text":"$(booth)","color":"gold","clickEvent":{"action":"run_command","value":"/trigger colosseum.tp_booth set 892734503"},"hoverEvent":{"action":"show_text","contents":[{"text":"Teleport to Booth","color":"gold"}]}},{"text":".","color":"white"}]
execute if data storage colosseum:active timeslot{booth:"Any Booth"} run tellraw @a [{"text":"[Summit] ","color":"aqua"},{"text":"The colosseum is active for any booth.","color":"white"}]
