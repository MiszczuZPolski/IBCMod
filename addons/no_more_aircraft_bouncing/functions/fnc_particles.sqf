#include "..\script_component.hpp"
/*
 * Author: Sceptre
 * Handles creation of particles upon vehicle destruction.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call ibc_no_more_aircraft_bouncing_fnc_particles;
 *
 * Public: No
 */
params ["_vehicle"];

if (!hasInterface) exitWith {};

if (GVAR(pfxHelicopters) && _vehicle isKindOf "Helicopter") then {
	private _p1 = "#particlesource" createVehicleLocal getPos _vehicle;
	_p1 setParticleClass "IEDMineGarbageBig1";
	_p1 attachTo [_vehicle, [0,0,0]];
	[{deleteVehicle _this}, _p1, 2] call CBA_fnc_waitAndExecute;

	private _p2 = "#particlesource" createVehicleLocal getPos _vehicle;
	_p2 setParticleClass "BombSmk3";
	_p2 attachTo [_vehicle, [0,0,0]];
	[{deleteVehicle _this}, _p2, 2] call CBA_fnc_waitAndExecute;
};

if (GVAR(pfxPlanes) && _vehicle isKindOf "Plane") then {
	private _p1 = "#particlesource" createVehicleLocal getPos _vehicle;
	_p1 setParticleClass "BombExp1";
	_p1 attachTo [_vehicle, [0,0,0]];
	[{deleteVehicle _this}, _p1, 1.3] call CBA_fnc_waitAndExecute;

	private _p2 = "#particlesource" createVehicleLocal getPos _vehicle;
	_p2 setParticleClass "BombSmk3";
	_p2 attachTo [_vehicle, [0,0,0]];
	[{deleteVehicle _this}, _p2, 2] call CBA_fnc_waitAndExecute;
};
