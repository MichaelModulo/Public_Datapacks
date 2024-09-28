
# set target
data modify storage util_npc:ungroup_trades conversation set from storage util_npc:ungroup_trades trades[0]

# check if group and rebuild array
execute if data storage util_npc:ungroup_trades conversation{type:"group"} run function util_npc:utility/ungroup_trades/found_group
execute unless data storage util_npc:ungroup_trades conversation{type:"group"} run data modify storage util_npc:ungroup_trades new_trades append from storage util_npc:ungroup_trades conversation

# [DEBUG]
execute if data storage util_npc:ungroup_trades conversation{type:"trade"} run data modify storage util_npc:ungroup_trades debug append value "T"
execute if data storage util_npc:ungroup_trades conversation{type:"group"} run data modify storage util_npc:ungroup_trades debug append value "❓"

# loop
data remove storage util_npc:ungroup_trades trades[0]
execute if data storage util_npc:ungroup_trades trades[0] run function util_npc:utility/ungroup_trades/process_trades

# reprocess if the there was a group
execute unless data storage util_npc:ungroup_trades new_trades[0] run return 0
scoreboard players remove #ungroup_trades.maximum_ungroups_left util_npc 1
execute if score #ungroup_trades.ungrouped_conversation util_npc matches 1 unless score #ungroup_trades.maximum_ungroups_left util_npc matches ..0 unless data storage util_npc:ungroup_trades trades[0] run function util_npc:utility/ungroup_trades/rerun
