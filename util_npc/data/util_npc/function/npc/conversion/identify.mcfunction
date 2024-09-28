
$execute if entity @s[type=$(type)] run function $(function)
$execute if entity @s[type=$(type)] run scoreboard players set #found_conversion util_npc 2

data remove storage util_npc:conversion_check conversion_options[0]
execute if data storage util_npc:conversion_check conversion_options[0] run function util_npc:npc/conversion/identify with storage util_npc:conversion_check conversion_options[0]
