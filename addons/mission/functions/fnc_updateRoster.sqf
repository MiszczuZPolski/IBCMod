#include "..\script_component.hpp"
/*
 *    Author: D.Anderson
 *    Lorem
 *
 *    Arguments:
 *    0: The Unit <OBJECT>
 *
 *    Return Value:
 *    Bool
 *
 *    Example:
 *    [player] call ibc_mission_fnc_updateRoster
 *
 *     Public: No
 */

params [["_unit", ACE_player]];

private _arr = units (group _unit);
private _units = [];

private _diaryGroup = _unit getVariable [QGVAR(diaryGroup), false];
private _diaryORBAT = _unit getVariable [QGVAR(diaryORBAT), false];
private _unitsRecords = _unit getVariable [QGVAR(unitsRecords), false];

// this loop for Group
private _grpStr = [
    '<font face="RobotoCondensedBold" size="18">',
    groupId group _unit,
    '</font>',
    '<br/>'
] joinString "";

_units pushBack _grpStr;

{
    if (isPlayer _x) then {
        private _eq = [_x, false] call FUNC(createEquipment);
        _units pushBack _eq;
    };
} forEach _arr;

// for now I don't how to resolve it without recreating this, to be completed somethere in the future
/*
// this loop for individual
for "_i" from ((count _arr) -1 ) to 0 step -1 do {
    if (isPlayer (_arr select _i)) then {
        private _eq = [_arr select _i, True] call FUNC(createEquipment);
        // systemChat format["%1, %2", _i, (name (_arr select _i))];

        // this maybe buggy, cuz players can change slots etc disconnect or connect, should delete and recreate?
        // _unit setDiaryRecordText [["roster", _unitsRecords select _i ], [["Wyposażenie", (name (_arr select _i))] joinString " ", _eq, ""]];
    };
};
*/

private _group = _units joinString "";
private _orbat = [_unit] call FUNC(createORBAT);

_unit setDiaryRecordText [["roster", _diaryGroup], [LLSTRING(Roster_Group_Inventory), _group, ""]];
_unit setDiaryRecordText [["roster", _diaryORBAT], ["ORBAT", _orbat, ""]];
