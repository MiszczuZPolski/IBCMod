#include "..\script_component.hpp"
/*
 *    Author: D.Anderson
 *    Gets uniform, vest, backpack and stuff, gets its name and image and crates string with HTML image compatible with diary records
 *
 *    Arguments:
 *    0: The Unit <OBJECT>
 *    1: Details <BOOL>
 *
 *    Return Value:
 *    String
 *
 *    Example:
 *    [player, False] call ibc_mission_fnc_getEquipment
 *
 *     Public: No
 */

 params [["_unit", ACE_player], ["_details", False]];

// begin of inline funcs
private _fnc_createEntry = {
    private _str = '';
    private _displayName = getText (configFile >> "CfgWeapons" >>  _this select 0 >> "displayName");
    private _picture = getText (configFile >> "CfgWeapons" >>  _this select 0 >> "picture");

    if (_displayName == "" || _picture == "") then {
        _displayName = getText (configFile >> "cfgVehicles" >>  _this select 0 >> "displayName");
        _picture = getText (configFile >> "cfgVehicles" >>  _this select 0 >> "picture");
    };
    if (_displayName == "" || _picture == "") then {
        _displayName = getText (configFile >> "CfgMagazines" >>  _this select 0 >> "displayName");
        _picture = getText (configFile >> "CfgMagazines" >>  _this select 0 >> "picture");
    };

    if (_displayName != "" || _picture != "") then {
        // if has .paa then array will have 2 elements, if don't means it dosen't
        private _condition = count (_picture splitString ".");
        private _picture = if (_condition > 1) then [{_picture}, {[_picture, ".paa"] joinString ""}];
        _str = ['<img title="', _displayName, '" src="', _picture, '" height="', _this select 1, '"/>'] joinString "";
    } else {
        _str = ['x', _this select 0, ', ' ] joinString "";
    };

    _str
};

private _fnc_countInvertory = {
    private _noDuplicates = (_this select 0) arrayIntersect (_this select 0);
    private _result = [];
    {
        private _original = _x;
        private _count = 0;
        {
            if (_x == _original) then {
                _count  = _count + 1;
            };

        } forEach (_this select 0);
        _result pushBack [_original, str _count];
    } forEach _noDuplicates;

    private _itemsArr = [];
    {
        private _name = [(_x select 0), '32'] call _fnc_createEntry;
        _itemsArr pushBack _name;
        private _count = [(_x select 1), '32'] call _fnc_createEntry;
        _itemsArr pushBack _count;
    } forEach _result;

    private _str = _itemsArr joinString "";
    _str
};
// end of inline funcs

//forEach eq
private _equipmentText = "";
private _equipmentArr = [];
_equipmentArr pushBack ([
    '<font color="#757575" face="RobotoCondensed">',
    LLSTRING(Roster_Inventory), ':',
    '</font><br/><br/>'
] joinString "");

private _arr = [uniform _unit, vest _unit, backpack _unit, headgear _unit, hmd _unit, binocular _unit] - [""];
//uniform _unit, vest _unit, backpack _unit,
// TODO: compat TFAR/ACRE...
//_arr append ([] call acre_api_fnc_getCurrentRadioList);
{
    private _returnVal = [_x, '48'] call _fnc_createEntry;
    _equipmentArr pushBack _returnVal;
    _equipmentArr pushBack " ";
} forEach _arr;

if (_details) then {
    _equipmentArr pushBack '<br/><br/>';

    // UNIFORM
    private _items = uniformItems _unit;
    if ((uniform _unit) != "") then {
        _equipmentArr pushBack ([
                '<font color="#757575" face="RobotoCondensed">',
                LLSTRING(Roster_Uniform), ':',
                '</font><br/>'
            ] joinString "");
            if (_items isNotEqualTo []) then {
                private _itemsStr = [_items] call _fnc_countInvertory;
                // systemChat format["getEquip: %1", _itemsStr];
                _equipmentArr pushBack _itemsStr;
            } else {
                _equipmentArr pushBack LLSTRING(Roster_None);
            };
    };

    // VEST
    if ((vest _unit) != "") then {
        _equipmentArr pushBack ([
                '<br/><br/>',
                '<font color="#757575" face="RobotoCondensed">',
                LLSTRING(Roster_Vest), ' :',
                '</font><br/>'
            ] joinString "");

            private _items = vestItems _unit;
            if (_items isNotEqualTo []) then {
                private _itemsStr = [_items] call _fnc_countInvertory;
                _equipmentArr pushBack _itemsStr;
            } else {
                _equipmentArr pushBack LLSTRING(Roster_None);
            };
    };


    // BACKPACK
    if ((backpack _unit) != "") then {
        _equipmentArr pushBack ([
                '<br/><br/>',
                '<font color="#757575" face="RobotoCondensed">',
                LLSTRING(Roster_Backpack), ':',
                '</font><br/>'
            ] joinString "");

            private _items = backpackItems _unit;
            if (_items isNotEqualTo []) then {
                private _itemsStr = [_items] call _fnc_countInvertory;
                _equipmentArr pushBack _itemsStr;
            } else {
                _equipmentArr pushBack LLSTRING(Roster_None);
            };
    };
};

_equipmentText = _equipmentArr joinString "";

// return
_equipmentText
