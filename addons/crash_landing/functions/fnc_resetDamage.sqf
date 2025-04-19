#include "..\script_component.hpp"

/*
 * Author: Freestyle_Build
 * Reset aircrafts state to default once it is repaired
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_aircraft] call ibc_crash_landing_fnc_resetDamage;
 *
 */

params ["_aircraft"];

[{
    params ["_aircraft", "_oldDamage"];

    damage _aircraft < _oldDamage

}, {

    params ["_aircraft"];

    if (isNull _aircraft || {!alive _aircraft}) exitWith {};

    _aircraft setVariable [QGVAR(effects), false, true];
    _aircraft setVariable [QGVAR(state), 0, true];

    if (GVAR(captiveSystem)) then {

        private _value = _aircraft getVariable [QGVAR(captiveState), false];
        _aircraft setCaptive _value;

        {
            private _value = _x getVariable [QGVAR(captiveState), false];
            _x setCaptive _value;
        } forEach (crew _aircraft);
    };

}, [_aircraft, damage _aircraft]] call CBA_fnc_waitUntilAndExecute;
