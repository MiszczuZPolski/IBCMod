#include "..\script_component.hpp"

/*
 * Author: Freestyle_Build
 * Handle the crashes of air vehicles using the handle damage eventhandler, returns new damage depending on state of the vehicle.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 * 1: Hit Selection <STRING>
 * 2: Damage <SCALAR>
 *
 * Return Value:
 * 0: Damage <SCALAR>
 *
 * Example:
 * _aircraft addEventHandler ["HandleDamage", {call FUNC(handleDamage)}];
 *
 */

params ["_aircraft", "_selection", "_damage"];

private _state = _aircraft getVariable [QGVAR(state), 0];
private _playerInVehicle = true;
private _allPlayers = allPlayers;

if GVAR(ignoreNonPlayerVehicles) then {
    _playerInVehicle = {
        if (_x in _allPlayers) exitWith { true };
        false;
    } forEach (crew _aircraft);
};

if (!_playerInVehicle && !(GVAR(stateThreshold) > _state) && !(alive _aircraft) && (_selection != "")) exitWith { _damage };

if (_damage > GVAR(damageTreshold)) then {

    private _newState = _state + _damage - (_aircraft getHit "");
    _aircraft setVariable [QGVAR(state), _newState, true];

    if (!(_aircraft getVariable [QGVAR(effects), false])) then {

        [_aircraft] remoteExecCall [QFUNC(effects), 0, true];

        [QGVAR(resetDamage), _aircraft] call CBA_fnc_serverEvent;

        if (GVAR(captiveSystem)) then {
            [QGVAR(setCaptive), _aircraft] call CBA_fnc_serverEvent;
        };

        if(GVAR(ejectionSystem)) then {
            [QGVAR(impactEjection), _aircraft] call CBA_fnc_serverEvent;
        };
    };
    GVAR(damageTreshold)
};
