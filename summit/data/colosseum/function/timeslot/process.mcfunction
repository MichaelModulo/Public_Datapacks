
scoreboard players remove $time_left colosseum 1

execute store result score #timeslots colosseum run data get storage colosseum:registry timeslots

# check for end
execute if score $time_left colosseum matches ..-1 run function colosseum:timeslot/next
