#include "..\script_component.hpp"
/*
 *    Author: D.Anderson
 *    Creates identity text to be added to roster
 *
 *    Arguments:
 *    0: The Unit <OBJECT>
 *
 *    Return Value:
 *    Array - [_rank, _rankImage, _name, _role, _weight]
 *
 *    Example:
 *    [player] call ibc_mission_fnc_getIdentity
 *
 *     Public: No
 */

params [["_unit", ACE_player]];

private _arr = [];

private _rank = rank _unit;
private _name = [" ", name _unit] joinString "";
private _role = if (roleDescription _unit != "") then [{roleDescription _unit}, {getText (configOf _unit >> "displayName")}];
private _weight = [_unit] call ace_common_fnc_getWeight;

//fix the role description
//remove anything after @
private _str = _role splitString "@";
_role = _str select 0;

//remove anything after (
_str = _role splitString "(";
_role = _str select 0;

//remove any numbering linek 1:
_str = _role splitString ":";
_role = if (isNil {_str select 1}) then [{ _str select 0 }, { _str select 1 }];
_role = [": ", _role] joinString "";
// ************************************************

// geting rank image
private _rankImage = switch (_rank) do {
    case "PRIVATE": { "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa" };
    case "CORPORAL": { "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa" };
    case "SERGEANT": { "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa" };
    case "LIEUTENANT": { "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa" };
    case "CAPTAIN": { "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa" };
    case "MAJOR": { "\A3\Ui_f\data\GUI\Cfg\Ranks\major_gs.paa" };
    case "COLONEL": { "\A3\Ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa" };
    case "GENERAL": { "\A3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa" };
};

_arr = [_rank, _rankImage, _name, _role, _weight];

_arr
