
scoreboard players set #found_conversion util_npc 1

# identify if set (respawn if not)
data modify storage util_npc:conversion_check conversion_options set from storage util_npc:reference npc_data.config.conversions
function util_npc:npc/conversion/identify with storage util_npc:conversion_check conversion_options[0]

# kill entity
tp @s ~ ~-1000 ~
kill @s
