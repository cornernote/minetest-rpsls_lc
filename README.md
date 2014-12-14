# Rock Paper Scissors Lizard Spock - LuaController for Minetest

Create a game of Rock Paper Scissors Lizard Spock

![Screenshot](https://raw.githubusercontent.com/cornernote/minetest-rpsls_lc/master/screenshot.png "Rock Paper Scissors Lizard Spock")


## Depends

* [mesecons](https://github.com/Jeija/minetest-mod-mesecons)
* [digilines](https://github.com/Jeija/minetest-mod-digilines)


## Items Required

- 12x LuaController (mesecons_luacontroller:luacontroller)
- 11x Button (mesecons_button:button_off)
- 3x LCD (digilines_lcd:lcd)
- 1x Player Detector (mesecons_detector:object_detector_off)
- 20x (approx) Digilines Wire (digilines:wire_std)
- 10x (approx) Mesecons Wire (mesecons:wire)


## How-To

- Place 5 LuaControllers for each player option (see [button_controller.lua](https://github.com/cornernote/minetest-rpsls_lc/blob/master/button_controller.lua))
- Place 1 LuaController for the reset button (see [reset_controller.lua](https://github.com/cornernote/minetest-rpsls_lc/blob/master/reset_controller.lua))
- Place a button in front of each of the button controllers and the reset controller.
- Place 1 LuaController for the game logic (see [game_controller.lua](https://github.com/cornernote/minetest-rpsls_lc/blob/master/game_controller.lua))
- Place 3 LCD screens, and name them: player1_display, player2_display and vs_display
- Connect everything with Digilines Wire
- Place a Player Detector and connect it to the game controller using Mesecons Wire


## Resources

- **[GitHub Project](https://github.com/cornernote/minetest-rpsls_lc)**
- **[Forum Page](https://forum.minetest.net/viewtopic.php?t=10748)**

## Support

- Does this README need improvement?  Go ahead and [suggest a change](https://github.com/cornernote/minetest-rpsls_lc/edit/master/README.md).
- Found a bug, or need help using this project?  Check the [open issues](https://github.com/cornernote/minetest-rpsls_lc/issues) or [create an issue](https://github.com/cornernote/minetest-rpsls_lc/issues/new).


## About

This module is open source, so it's distributed freely. If you find it useful then I ask not for your wealth, but simply to spare your time to consider the world we share by watching [Earthlings](http://earthlings.com/), a multi-award winning film available to watch online for free. A must-see for anyone who wishes to make the world a better place.


## License

[BSD-3-Clause](https://raw.github.com/cornernote/minetest-rpsls_lc/master/LICENSE), Copyright © 2013-2014 [Brett O'Donnell](http://cornernote.github.io/)
