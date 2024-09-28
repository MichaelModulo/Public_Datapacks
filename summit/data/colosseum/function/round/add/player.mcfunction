
function colosseum:utility/get_head
scoreboard players add #players colosseum 1
data modify storage colosseum:temp players append from storage colosseum:player_head profile.name
tag @s remove summit_colosseum_join_round
