#include "..\script_component.hpp"
/*
 * Author: Sceptre
 * Handles the event when a vehicle is killed.
 * Ensures that the vehicle does not bounce upon destruction.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call ibc_no_more_aircraft_bouncing_fnc_killed;
 *
 * Public: No
 */

params ["_vehicle"];

if (typeOf _vehicle in GVAR(excluded)) exitWith {};

[{
    params ["_vehicle"];
	isNull _vehicle || {isTouchingGround _vehicle}
},{
    params ["_vehicle"];
	if (isNull _vehicle) exitWith {};

	[{
		params ["_vehicle","_minTime"];

		if (isNull _vehicle) exitWith {true};

		private _velocity = velocity _vehicle;

		if (_velocity select 2 > 0) then {
			_vehicle setVelocity [_velocity select 0, _velocity select 1, -1];
		};

		(_velocity select 0) < 1 && (_velocity select 1) < 1 && _minTime < CBA_missionTime
	},{},[_vehicle, CBA_missionTime + 5], 15] call CBA_fnc_waitUntilAndExecute;

	[QGVAR(triggered), _vehicle] call CBA_fnc_globalEvent;
}, _vehicle, 60, {}] call CBA_fnc_waitUntilAndExecute;
