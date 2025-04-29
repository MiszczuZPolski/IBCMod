#include "..\script_component.hpp"
/*
 *    Author: D.Anderson
 *    Creates Group in Roster Subject
 *
 *    Arguments:
 *    0: The Unit <OBJECT>
 *    1: Details <BOOL>
 *
 *    Return Value:
 *    String
 *
 *    Example:
 *    [player, details] call ibc_mission_fnc_createEquipment
 *
 *     Public: No
 */

params [["_unit", ACE_player], ["_details", false]];

private _grpArr = [];

if (isPlayer _unit) then {

    [_unit] call FUNC(getIdentity) params ["_rank", "_rankImage", "_name", "_role", "_weight"];
    private _weaponsText = [_unit] call FUNC(getWeapons);
    private _equipmentText = [_unit, _details] call FUNC(getEquipment);

    private _grpText = [
        '<img title="', _rank, '" src="',_rankImage, '" height="16"/>',
        '<font color="#cba030" size="17" face="RobotoCondensed">', _name, '</font>',
        '<font color="#757575" size="17" face="RobotoCondensed">', _role,'</font>',
        '<font color="#757575" size="16" face="RobotoCondensed"> - W: </font>',
        '<font  size="16" face="RobotoCondensed">', _weight,'</font>',
        '<br/>',
        _weaponsText,
        _equipmentText,
        '<br/>',
        '.................................................................................................................',
        '<br/>'
    ] joinString "";
    _grpArr pushBack _grpText;
};

if (_details) then {
    _grpArr pushBack LLSTRING(Roster_Information);
    _grpArr pushBack '<br/>';
};

private _group = _grpArr joinString "";

_group
