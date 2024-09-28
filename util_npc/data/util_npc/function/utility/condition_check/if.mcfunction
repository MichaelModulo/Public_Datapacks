
# entity selector
scoreboard players set #condition_check.failed_check util_npc 1
$execute $(statement) run scoreboard players set #condition_check.failed_check util_npc 0
execute if score #condition_check.failed_check util_npc matches 1 run scoreboard players set #condition_check.condition_passed util_npc 0
