#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

[
    "IBC Screenshot",
    QGVAR(screenshot),
    "HUD Free Screenshot",
    { call FUNC(screenshot); },
    "", [DIK_F11, [false, false, false]]
] call CBA_fnc_addKeybind;

GVAR(screenshotMode) = false;
[
    "IBC Screenshot",
    QGVAR(screenshotToggle),
    "Toggle Screenshot Mode",
    { call FUNC(screenshotMode); },
    "", [DIK_F10, [false, false, false]]
] call CBA_fnc_addKeybind;

ADDON = true;
