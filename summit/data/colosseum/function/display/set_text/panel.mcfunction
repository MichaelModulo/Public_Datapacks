
execute if score #seconds colosseum matches 10.. run data modify entity @s text set value '["",{"text":"Colosseum Info","underlined":true,"color":"gold"},{"text":"\\n\\n"},{"text":"Panel Reserved","color":"light_purple"},{"text":"\\n"},{"text":"","color":"yellow"},{"text":"\\n\\n\\n"},{"text":"","color":"#D2CA7F"}]'
execute if score #seconds colosseum matches ..9 run data modify entity @s text set value '["",{"text":"Colosseum Info","underlined":true,"color":"gold"},{"text":"\\n\\n"},{"text":"Panel Reserved","color":"light_purple"},{"text":"\\n"},{"text":"","color":"yellow"},{"text":"\\n\\n\\n"},{"text":"","color":"#D2CA7F"}]'