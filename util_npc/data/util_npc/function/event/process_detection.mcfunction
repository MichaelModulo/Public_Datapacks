
# time
execute store result score #daytime util_npc run time query daytime
execute store result score #day util_npc run time query day

# last recognized
execute store result score #last_recognized_daytime util_npc run data get storage util_npc:reference npc_save.memory.recognized.daytime
execute store result score #last_recognized_day util_npc run data get storage util_npc:reference npc_save.memory.recognized.day
execute store result storage util_npc:reference npc_save.memory.recognized.daytime int 1 run scoreboard players get #daytime util_npc
execute store result storage util_npc:reference npc_save.memory.recognized.day int 1 run scoreboard players get #day util_npc

# reset time
execute unless score #day util_npc = #last_recognized_day util_npc run data remove storage util_npc:reference npc_save.memory.recognized.daily

# time
execute if score #daytime util_npc matches 6000..6600 unless data storage util_npc:reference npc_save.memory.recognized.daily{noon:true} store success storage util_npc:reference npc_save.memory.recognized.daily.noon byte 1 run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/time/noon"
execute if score #daytime util_npc matches 12500..13100 unless data storage util_npc:reference npc_save.memory.recognized.daily{sunset:true} store success storage util_npc:reference npc_save.memory.recognized.daily.sunset byte 1 run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/time/sunset"
execute if score #daytime util_npc matches 18000..18600 unless data storage util_npc:reference npc_save.memory.recognized.daily{midnight:true} store success storage util_npc:reference npc_save.memory.recognized.daily.midnight byte 1 run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/time/midnight"
execute if score #daytime util_npc matches 23000..23600 unless data storage util_npc:reference npc_save.memory.recognized.daily{sunrise:true} store success storage util_npc:reference npc_save.memory.recognized.daily.sunrise byte 1 run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/time/sunrise"
execute if score #daytime util_npc matches 0..600 unless data storage util_npc:reference npc_save.memory.recognized.daily{awake:true} store success storage util_npc:reference npc_save.memory.recognized.daily.awake byte 1 run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/time/awake"
execute if score #daytime util_npc matches 2000..2600 unless data storage util_npc:reference npc_save.memory.recognized.daily{work_start:true} store success storage util_npc:reference npc_save.memory.recognized.daily.work_start byte 1 run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/time/work_start"
execute if score #daytime util_npc matches 9000..9600 unless data storage util_npc:reference npc_save.memory.recognized.daily{work_end:true} store success storage util_npc:reference npc_save.memory.recognized.daily.work_end byte 1 run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/time/work_end"
execute if score #daytime util_npc matches 12000..12600 unless data storage util_npc:reference npc_save.memory.recognized.daily{sleep:true} store success storage util_npc:reference npc_save.memory.recognized.daily.sleep byte 1 run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/time/sleep"

# weather
data modify storage util_npc:reference previous_weather set from storage util_npc:reference npc_save.memory.recognized.weather
execute store success storage util_npc:reference npc_save.memory.recognized.weather.raining byte 1 if predicate util_npc:weather/raining
execute store success storage util_npc:reference npc_save.memory.recognized.weather.thundering byte 1 if predicate util_npc:weather/thundering
execute if data storage util_npc:reference previous_weather{raining:true} if data storage util_npc:reference npc_save.memory.recognized.weather{raining:false} run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/weather/clear"
execute if data storage util_npc:reference previous_weather{raining:false} if data storage util_npc:reference npc_save.memory.recognized.weather{raining:true} run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/weather/raining"
execute if data storage util_npc:reference previous_weather{thundering:false} if data storage util_npc:reference npc_save.memory.recognized.weather{thundering:true} run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/weather/thundering"
execute if data storage util_npc:reference previous_weather{thundering:true} if data storage util_npc:reference npc_save.memory.recognized.weather{thundering:false} run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/weather/thundering_clear"

# random
execute if predicate util_npc:rand_event/avg_10_min run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/random/avg_10_min"
execute if predicate util_npc:rand_event/avg_30_min run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/random/avg_30_min"
execute if predicate util_npc:rand_event/avg_1_hr run data modify storage util_npc:reference npc_save.memory.events.queue append value "util_npc:event/random/avg_1hr"

# add tag
execute if data storage util_npc:reference npc_save.memory.events.queue[0] run tag @s add util_npc_events_queued

# recompile trades
execute unless score #day util_npc = #last_recognized_day util_npc run function util_npc:trade/recompile/init
execute unless data storage util_npc:reference npc_save.memory.compiled_trades run function util_npc:trade/recompile/init
