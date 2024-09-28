
# get time
summon marker ~ ~ ~ {Tags:["util_npc_random_uuid"]}
execute store result score #condition.random util_npc run data get entity @e[type=marker,tag=util_npc_random_uuid,sort=random,limit=1] UUID[0]
scoreboard players operation #condition.random util_npc %= #100 util_npc
kill @e[type=marker,tag=util_npc_random_uuid,sort=random,limit=1]

# custom check
execute store result score #condition.chance util_npc run data get storage util_npc:condition_check conditions.random.chance
execute unless data storage util_npc:condition_check conditions{random:{chance:{inverse:true}}} unless score #condition.random util_npc <= #condition.chance util_npc run scoreboard players set #condition_check.condition_passed util_npc 0
execute if data storage util_npc:condition_check conditions{random:{chance:{inverse:true}}} unless score #condition.random util_npc > #condition.chance util_npc run scoreboard players set #condition_check.condition_passed util_npc 0
