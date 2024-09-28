
# copy trades
$data modify storage util_npc:ungroup_trades new_trades append from storage util_npc:reference npc_data.trades[{id:"$(conversation_id)"}]
