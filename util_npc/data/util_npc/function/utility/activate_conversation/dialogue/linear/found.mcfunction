

scoreboard players operation #dialogue_progress_value util_npc = #activate_conversation.linear_search.index util_npc
scoreboard players add #dialogue_progress_value util_npc 1
scoreboard players operation #activate_conversation.counter_value util_npc = #dialogue_progress_value util_npc

function util_npc:utility/activate_conversation/dialogue/found
