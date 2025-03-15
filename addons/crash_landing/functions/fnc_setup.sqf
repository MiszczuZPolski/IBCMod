#include "..\script_component.hpp"

/*
 * Author: Freestyle_Build
 * Setup new aircrafts upon initialization
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_aircraft] call ibc_crash_landing_fnc_setup;
 *
 */

params ["_aircraft"];

_aircraft setVariable [QGVAR(state), 0, true];
_aircraft setVariable [QGVAR(effects), false, true];

_aircraft addEventHandler ["HandleDamage", {call FUNC(handleDamage)}];
