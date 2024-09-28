
# get time
execute store result score #condition.time util_npc run time query daytime

# custom check
execute store result score #condition.time.min util_npc run data get storage util_npc:condition_check conditions.time.range.min
execute store result score #condition.time.max util_npc run data get storage util_npc:condition_check conditions.time.range.max
execute unless data storage util_npc:condition_check conditions{time:{range:{inverse:true}}} if data storage util_npc:condition_check conditions.time.range.min unless score #condition.time util_npc >= #condition.time.min util_npc run scoreboard players set #condition_check.condition_passed util_npc 0
execute unless data storage util_npc:condition_check conditions{time:{range:{inverse:true}}} if data storage util_npc:condition_check conditions.time.range.max unless score #condition.time util_npc <= #condition.time.max util_npc run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{range:{inverse:true}}} if data storage util_npc:condition_check conditions.time.range.min unless score #condition.time util_npc < #condition.time.min util_npc run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{range:{inverse:true}}} if data storage util_npc:condition_check conditions.time.range.max unless score #condition.time util_npc > #condition.time.max util_npc run scoreboard players set #condition_check.condition_passed util_npc 0

# preset checks
execute if data storage util_npc:condition_check conditions{time:{day:true}} unless score #condition.time util_npc matches 1..12000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{day:false}} if score #condition.time util_npc matches 1..12000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{night:true}} unless score #condition.time util_npc matches 12001..24000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{night:false}} if score #condition.time util_npc matches 12001..24000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{morning:true}} unless score #condition.time util_npc matches 1..6000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{morning:false}} if score #condition.time util_npc matches 1..6000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{midday:true}} unless score #condition.time util_npc matches 6001..12000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{midday:false}} if score #condition.time util_npc matches 6001..12000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{noon:true}} unless score #condition.time util_npc matches 12001..18000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{noon:false}} unless score #condition.time util_npc matches 12001..18000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{midnight:true}} if score #condition.time util_npc matches 18001..24000 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{time:{midnight:false}} unless score #condition.time util_npc matches 18001..24000 run scoreboard players set #condition_check.condition_passed util_npc 0
