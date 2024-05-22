#include "script_component.hpp"

// Exit if not player client
if (!hasInterface) exitWith {};

HLC_ShowBarrelActions = false; // Remove NiArms Barrel Actions
CUP_stopLampCheck = true; // Disable CUP street lights based on lighting levels (bad performance script)

["CBA_settingsInitialized", {
    ["unit", FUNC(equipmentList), true] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;

if GVAR(arsenalCheck) then {
    ["featureCamera", {[_this] call FUNC(arsenalCheck);}] call CBA_fnc_addPlayerEventHandler;
};
