
$data modify storage colosseum:return database set from storage colosseum:registry players[{uuid:"$(uuid)"}]
$data remove storage colosseum:registry players[{uuid:"$(uuid)"}].inventory
$data remove storage colosseum:registry players[{uuid:"$(uuid)"}].booth
