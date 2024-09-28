
# get data
data modify storage util_npc:reference interaction_raw set from entity @s

# check if npc is correct
execute store result score #gametime util_npc run time query gametime
execute if score #interaction_mode util_npc matches 1 store result score #interaction_time util_npc run data get storage util_npc:reference interaction_raw.interaction.timestamp
execute if score #interaction_mode util_npc matches 2 store result score #interaction_time util_npc run data get storage util_npc:reference interaction_raw.attack.timestamp

# passes check
execute if score #interaction_time util_npc = #gametime util_npc run function util_npc:npc/interacted_with
