#include "..\script_component.hpp"
/*
 *    Author: D.Anderson
 *    Initialization of roster scripts, create dairy records for ORBAT, Group and every player in the group
 *
 *    Arguments:
 *    0: The Unit <OBJECT>
 *
 *    Return Value:
 *    Bool
 *
 *    Example:
 *    [player] call dAn_fnc_initRoster
 *
 *     Public: No
 */

params [["_unit", ACE_player]];

_unit createDiarySubject ["roster", LLSTRING(Roster_Inventory)];

private _arr = units (group _unit);
private _units = [];
private _unitsRecords = [];
private _eq = "";

// loop for Group
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

// loop for individual
for "_i" from ((count _arr) - 1) to 0 step -1 do {
    if (isPlayer (_arr select _i)) then {
        _eq = [_arr select _i, true] call FUNC(createEquipment);

        private _var = _unit createDiaryRecord ["roster", [[LLSTRING(Roster_Inventory), (name (_arr select _i))] joinString " ", _eq, ""], taskNull, "NONE", false];
        _unitsRecords pushBack _var;
    };
};

_units = _units joinString "";
private _orbat = [_unit] call FUNC(createORBAT);

private _diaryGroup = _unit createDiaryRecord ["roster", [LLSTRING(Roster_Group_Inventory), _units, ""], taskNull, "NONE", false];
private _diaryORBAT = _unit createDiaryRecord ["roster", ["ORBAT", _orbat, ""], taskNull, "NONE", false];

_unit setVariable [QGVAR(diaryGroup), _diaryGroup];
_unit setVariable [QGVAR(diaryORBAT), _diaryORBAT];
_unit setVariable [QGVAR(unitsRecords), _unitsRecords];

[{
    params ["_args", "_idPFH"];
    _args params ["_unit"];

    if (missionNamespace getVariable [QGVAR(briefingMode), false] || CBA_missionTime > (15 * 60)) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    [_unit] call FUNC(updateRoster);
}, 10, [_unit]] call CBA_fnc_addPerFrameHandler;
