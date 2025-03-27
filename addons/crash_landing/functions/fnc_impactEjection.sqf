#include "..\script_component.hpp"

/*
 * Author: Freestyle_Build
 * Eject passengers of the aircraft, if certain conditions are met.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * <NONE>
 *
 * Example:
 * _aircraft call ibc_crash_landing_fnc_impactEjection;
*/

params ["_aircraft"];

private _gThreshold = GVAR(gForceThreshold);
private _ejectProp = GVAR(ejectionProp);

private _timeStep = 0.1;

private _previousVelocity = velocity _aircraft;

[{
    params ["_args", "_idPFH"];
    _args params ["_aircraft"];

    if ((alive _aircraft) && (_aircraft getVariable [QGVAR(effects), false])) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    if(((getPos _aircraft) select 2) <= 2) then
	{
		private _gForce = (vectorMagnitude (_previousVelocity vectorDiff (velocity _aircraft))) / 0.1 / 9.81;

		if (_gForce >= GVAR(gForceThreshold)) then {
			{
				if ((random 100) <= GVAR(ejectionProp)) then {
					moveOut _x;

					_x setVelocity ((velocity _aircraft) vectorAdd ((getPosASL _aircraft) vectorFromTo (getPosASL _x))) vectorMultiply 2;

					_null =_x spawn {
										if ((lifeState _this) != "INCAPACITATED") then
										{
											_this setUnconscious true;
											sleep 2;
											_this setUnconscious false;
										};
									};
				};
			} forEach (crew _aircraft);
		};
	};

}, 0.1, [_aircraft]] call CBA_fnc_addPerFrameHandler;
