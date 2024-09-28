# Will choose a conversation in order or at random.
# &uses = util_npc:reference player_save
# &uses = #interaction_mode util_npc
# $output_score = array of conversation

# init
$data remove storage $(output_storage)
data remove storage util_npc:choose_conversation chosen_conversation
$data modify storage util_npc:choose_conversation conversations set from storage $(input_storage)
data modify storage util_npc:choose_conversation first_conversation set from storage util_npc:choose_conversation conversations[0]

# load continuation
execute if score #interaction_mode util_npc matches 1 unless data storage util_npc:choose_conversation chosen_conversation run function util_npc:utility/continue_conversation/load/run {continue_save:"util_npc:reference npc_save.memory.continue_conversation.chat",output_conversation:"util_npc:choose_conversation chosen_conversation"}
execute if score #interaction_mode util_npc matches 2 unless data storage util_npc:choose_conversation chosen_conversation run function util_npc:utility/continue_conversation/load/run {continue_save:"util_npc:reference npc_save.memory.continue_conversation.attack",output_conversation:"util_npc:choose_conversation chosen_conversation"}
execute if score #interaction_mode util_npc matches 1 unless data storage util_npc:choose_conversation chosen_conversation run function util_npc:utility/continue_conversation/load/run {continue_save:"util_npc:reference player_save.memory.continue_conversation.chat",output_conversation:"util_npc:choose_conversation chosen_conversation"}
execute if score #interaction_mode util_npc matches 2 unless data storage util_npc:choose_conversation chosen_conversation run function util_npc:utility/continue_conversation/load/run {continue_save:"util_npc:reference player_save.memory.continue_conversation.attack",output_conversation:"util_npc:choose_conversation chosen_conversation"}

# override values
execute if data storage util_npc:choose_conversation chosen_conversation{type:"event"} run data modify storage util_npc:choose_conversation chosen_conversation.save set value "npc"

# queue conversation
execute if data storage util_npc:choose_conversation first_conversation{order:"queue"} unless data storage util_npc:choose_conversation chosen_conversation run data modify storage util_npc:choose_conversation chosen_conversation set from storage util_npc:choose_conversation first_conversation

# random conversation
execute if data storage util_npc:choose_conversation first_conversation{order:"random"} unless data storage util_npc:choose_conversation chosen_conversation run function util_npc:utility/choose_conversation/random/init

# store output
$data modify storage $(output_storage) set from storage util_npc:choose_conversation chosen_conversation

# add continutation
execute if score #interaction_mode util_npc matches 1 if data storage util_npc:choose_conversation chosen_conversation{save:"npc"}.continuation run function util_npc:utility/continue_conversation/save/run {continue_save:"util_npc:reference npc_save.memory.continue_conversation.chat",input_conversation:"util_npc:choose_conversation chosen_conversation"}
execute if score #interaction_mode util_npc matches 2 if data storage util_npc:choose_conversation chosen_conversation{save:"npc"}.continuation run function util_npc:utility/continue_conversation/save/run {continue_save:"util_npc:reference npc_save.memory.continue_conversation.attack",input_conversation:"util_npc:choose_conversation chosen_conversation"}
execute if score #interaction_mode util_npc matches 1 if data storage util_npc:choose_conversation chosen_conversation{save:"player"}.continuation run function util_npc:utility/continue_conversation/save/run {continue_save:"util_npc:reference player_save.memory.continue_conversation.chat",input_conversation:"util_npc:choose_conversation chosen_conversation"}
execute if score #interaction_mode util_npc matches 2 if data storage util_npc:choose_conversation chosen_conversation{save:"player"}.continuation run function util_npc:utility/continue_conversation/save/run {continue_save:"util_npc:reference player_save.memory.continue_conversation.attack",input_conversation:"util_npc:choose_conversation chosen_conversation"}
