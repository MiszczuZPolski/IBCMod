#include "..\script_component.hpp"

/*
 * Author: Freestyle_Build
 * Sets vehicle captive and prepares its crew to be reset once the is repaired/landed. Also forces AI to stay inside helicopters.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_aircraft] remoteExec [QEFUNC(main,setCaptive), 2];
 *
 */

params ["_aircraft"];

_aircraft setVariable [QGVAR(captiveState), captive _aircraft];

private _crew = crew _aircraft;

{
    _x setVariable [QGVAR(captiveState), captive _x];
} forEach _crew;

{
    _x setCaptive true;

    private _index = _x addEventHandler ["GetOutMan", {

        params ["_unit", "_role", "_vehicle", "_turret"];

        if ((getPos _vehicle #2) < 3 || {isPlayer _unit || {!(_vehicle isKindOf "Helicopter")}}) then {

            private _value = _unit getVariable [QGVAR(captiveState), false];
            _unit setCaptive _value;

            private _index = _unit getVariable [QGVAR(captiveEventHandler), -1];
            _unit removeEventHandler ["GetOutMan", _index];

        } else {

            call {
                if (_role isEqualTo "driver") exitWith {
                    _unit moveInTurret [_vehicle, _turret];
                };

                if (_role isEqualTo "gunner") exitWith {
                    _unit moveInTurret [_vehicle, _turret];
                };

                _unit moveInCargo _vehicle;
            };
        };
    }];

    _x setVariable [QGVAR(captiveEventHandler), _index];
} forEach _crew;

_aircraft setCaptive true;

[{
    params ["_aircraft"];

    isNull _aircraft || {!alive _aircraft || {(getPos _aircraft #2) > 2}}

}, {
    params ["_aircraft", "_crew"];


    private _value = _aircraft getVariable [QGVAR(captiveState), false];
    _aircraft setVariable [QGVAR(captiveState), _value];

    private _crew = crew _aircraft;

    {
        private _value = _x getVariable [QGVAR(captiveState), false];
        _x setVariable [QGVAR(captiveState), _value];
    } forEach _crew;

}, [_aircraft, _crew]] call CBA_fnc_waitUntilAndExecute;
