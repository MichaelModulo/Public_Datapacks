#tellraw @a {"text":"Loaded cap"}

scoreboard objectives add colosseum dummy
scoreboard objectives add colesseum.death deathCount
scoreboard objectives add colesseum.leave minecraft.custom:minecraft.leave_game
scoreboard objectives add colosseum.tp_booth trigger

scoreboard players set #60 colosseum 60

schedule function colosseum:main 1t
