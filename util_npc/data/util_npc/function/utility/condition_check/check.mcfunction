
# conditions
execute if data storage util_npc:condition_check conditions.time run function util_npc:utility/condition_check/time

execute if data storage util_npc:condition_check conditions.weather run function util_npc:utility/condition_check/weather

execute if data storage util_npc:condition_check conditions.week run function util_npc:utility/condition_check/week

execute if data storage util_npc:condition_check conditions.random run function util_npc:utility/condition_check/random

execute if data storage util_npc:condition_check conditions.memory[0] run function util_npc:utility/condition_check/memory/init

data modify storage util_npc:macro if_condition.statement set from storage util_npc:condition_check conditions.if.statement
execute if data storage util_npc:condition_check conditions.if.statement run function util_npc:utility/condition_check/if with storage util_npc:macro if_condition

data modify storage util_npc:macro custom_condition set from storage util_npc:condition_check conditions.custom
execute if data storage util_npc:condition_check conditions.custom run function util_npc:utility/condition_check/custom with storage util_npc:macro custom_condition

# function tag
# <<< FUNCTION TAG >>>
