
# get weather
scoreboard players set #condition.weather_raining util_npc 0
execute if predicate util_npc:weather/raining run scoreboard players set #condition.weather_raining util_npc 1
scoreboard players set #condition.weather_thundering util_npc 0
execute if predicate util_npc:weather/thundering run scoreboard players set #condition.weather_thundering util_npc 1

# preset checks
execute if data storage util_npc:condition_check conditions{weather:{raining:true}} unless score #condition.weather_raining util_npc matches 1 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{weather:{raining:false}} unless score #condition.weather_raining util_npc matches 0 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{weather:{thundering:true}} unless score #condition.weather_thundering util_npc matches 1 run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{weather:{thundering:false}} unless score #condition.weather_thundering util_npc matches 0 run scoreboard players set #condition_check.condition_passed util_npc 0
