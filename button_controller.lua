--[[

Rock Paper Scissors Lizard Spock
LuaController for Minetest

Copyright (c) 2014 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-rpsls-lc
License: BSD-3-Clause

]]--


player = 'player1' -- player1|player2
option = 'rock' -- rock|paper|scissors|lizard|spock

if (event.type=='on') then
  digiline_send(player, option)
end