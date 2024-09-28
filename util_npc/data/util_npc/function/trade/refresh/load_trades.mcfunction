
# reset loaded conversations
data remove storage util_npc:reference loaded_trades

# load conversations
data modify storage util_npc:reference loaded_trades append from storage util_npc:reference npc_data.trades[{id:"util_npc:load"}]

# function tag
# <<< FUNCTION TAG >>>
