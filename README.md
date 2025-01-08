# Defold Gamepad Mapper

TODO: Write files out after mapping is complete.

This is a tool for creating gamepad mapping files for the Defold game engine.
It provides a simple GUI that allows connected controllers to be mapped, and
writes out a `.gamepads` map file when mapping is complete. This file can be
appended to Defold's `default.gamepads` file and contributed back to Defold,
or used in the game's custom file.

It is intended to be used by developers who may want to:

* build and run it locally to create their own mapping files;
* send platform-specific builds to play-testers or users with unsupported controllers;
* debug reported issues from users with specific gamepads by creating a new map;

It uses an *empty* gamepad mapping so that no existing controller is recognised.
This allows re-mapping of existing controllers so they can be compared to the default
mapping in case anything is wrong. Note that this does NOT mean this tool is always
correct, it is possible/likely that there are bugs or edge-cases that aren't handled.

Please report any problems using GitHub issues.
