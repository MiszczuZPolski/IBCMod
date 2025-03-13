#include "..\script_component.hpp"
/*
 *	Author: D.Anderson
 *	Lorem
 *	
 *	Arguments:
 *	0: The Unit <OBJECT>
 *	
 *	Return Value:
 *	Bool
 *	
 *	Example:
 *	[player] call ibc_mission_fnc_updateRoster
 *	
 * 	Public: No
 */

params [["_unit", ACE_player]];

private _arr = units (group _unit);
private _units = [];

private _diaryGroup = _unit getVariable [QGVAR(diaryGroup), false];
private _diaryORBAT = _unit getVariable [QGVAR(diaryORBAT), false];
private _unitsRecords = _unit getVariable [QGVAR(unitsRecords), false];

// this loop for Group
{
	if (isPlayer _x) then {
		_eq = [_x, False] call FUNC(createEquipment);
		_units pushBack _eq;
	};
} forEach _arr;

// this loop for individual
for "_i" from ((count _arr)-1) to 0 step -1 do {
	if(isPlayer (_arr select _i)) then {
		private _eq = [_arr select _i, True] call FUNC(createEquipment);
		// systemChat format["%1, %2", _i, (name (_arr select _i))];
		
		// this maybe buggy, cuz players can change slots etc disconnect or connect, should delete and recreate?
		_unit setDiaryRecordText [["roster", _unitsRecords select _i ], [["Wyposażenie", (name (_arr select _i))] joinString " ", _eq, ""]];
	};
};

_group = _units joinString "";
_orbat = [_unit] call FUNC(createORBAT);

_unit setDiaryRecordText [["roster", _diaryGroup], ["Wyposażenie grupy", _group, ""]];
_unit setDiaryRecordText [["roster", _diaryORBAT], ["ORBAT", _orbat, ""]];