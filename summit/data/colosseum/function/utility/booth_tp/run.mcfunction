
$data modify storage colosseum:temp macro.position_x set from storage colosseum:temp timeslots[{booth:"$(booth)"}].position[0]
$data modify storage colosseum:temp macro.position_y set from storage colosseum:temp timeslots[{booth:"$(booth)"}].position[1]
$data modify storage colosseum:temp macro.position_z set from storage colosseum:temp timeslots[{booth:"$(booth)"}].position[2]
$data modify storage colosseum:temp macro.rotation_x set from storage colosseum:temp timeslots[{booth:"$(booth)"}].rotation[0]
$data modify storage colosseum:temp macro.rotation_y set from storage colosseum:temp timeslots[{booth:"$(booth)"}].rotation[1]
function colosseum:utility/booth_tp/teleport with storage colosseum:temp macro
