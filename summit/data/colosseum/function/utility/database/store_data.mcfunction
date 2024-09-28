
$execute unless data storage colosseum:registry players[{uuid:"$(uuid)"}] run data modify storage colosseum:registry players append value {uuid:"$(uuid)",name:"$(name)",booth:"$(booth)",inventory:$(inventory)}
$execute if data storage colosseum:registry players[{uuid:"$(uuid)"}] run data modify storage colosseum:registry players[{uuid:"$(uuid)"}] set value {uuid:"$(uuid)",name:"$(name)",booth:"$(booth)",inventory:$(inventory)}
