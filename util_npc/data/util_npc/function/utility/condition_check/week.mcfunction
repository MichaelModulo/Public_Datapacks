
# get variables
execute store result score #condition.week.total_days util_npc run time query day
execute store result score #condition.week.length util_npc run data get storage util_npc:condition_check conditions.week.length
execute store result score #condition.week.day util_npc run data get storage util_npc:condition_check conditions.week.day
execute store result score #condition.week.offset util_npc run data get storage util_npc:condition_check conditions.week.offset
execute store result score #condition.week.inverse util_npc run data get storage util_npc:condition_check conditions.week.inverse

# calculate day
scoreboard players operation #condition.week.current_day util_npc = #condition.week.total_days util_npc
scoreboard players operation #condition.week.current_day util_npc -= #condition.week.offset util_npc
scoreboard players operation #condition.week.current_day util_npc %= #condition.week.length util_npc
scoreboard players add #condition.week.current_day util_npc 1

# preset checks
execute unless score #condition.week.inverse util_npc matches 1 unless score #condition.week.current_day util_npc = #condition.week.day util_npc run scoreboard players set #condition_check.condition_passed util_npc 0
execute if score #condition.week.inverse util_npc matches 1 if score #condition.week.current_day util_npc = #condition.week.day util_npc run scoreboard players set #condition_check.condition_passed util_npc 0
