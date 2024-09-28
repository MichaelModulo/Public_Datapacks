
# check for matching event
$execute unless data storage util_npc:check_conversations conversation{event:"$(id)"} run scoreboard players set #check_conversations.event_matched util_npc 0
