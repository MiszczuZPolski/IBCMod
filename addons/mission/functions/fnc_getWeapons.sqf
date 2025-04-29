#include "..\script_component.hpp"
/*
 *    Author: D.Anderson
 *    Gets weapon and any attachment of unit, gets its name and image and crates string with HTML image compatible with diary records
 *
 *    Arguments:
 *    0: The Unit <OBJECT>
 *
 *    Return Value:
 *    String - can be direcly inserted into diary, empty if not weaponAccessories
 *
 *    Example:
 *    [player] call ibc_mission_fnc_getWeapons
 *
 *     Public: No
 */

params [["_unit", ACE_player]];

private _weaponsText = "";

// forEach primary Weapon + attachments
private _primaryWeaponText = "";

if (primaryWeapon _unit != "") then {
    private _primaryWeaponArr = [];
    private _arr = [];
    _arr pushBack primaryWeapon _unit;
    _arr append (primaryWeaponItems _unit) + (primaryWeaponMagazine _unit) - [""];

    _primaryWeaponArr pushBack ([
        '<font color="#757575" face="RobotoCondensed">',
        LLSTRING(Roster_Primary), ': ',
        '</font>',
        getText(configFile >> "CfgWeapons" >> primaryWeapon _unit >> "displayName"),
        '<br/>'
    ] joinString "");

    {
        private _displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
        private _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");

        if (_displayName == "" || _picture == "") then {
            _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgMagazines" >> _x >> "picture");
        };

        private _str = ['<img title="', _displayName, '" src="', _picture, '" height="48"/>  '] joinString "";
        _primaryWeaponArr pushBack _str;
    } forEach _arr;

    _primaryWeaponArr pushBack '<br/>';
    _primaryWeaponText = _primaryWeaponArr joinString "";
};

// forEach secondary Weapon + attachments
private _secondaryWeaponText = "";

if (secondaryWeapon _unit != "") then {
    private _secondaryWeaponArr = [];
    private _arr = [];
    _arr pushBack secondaryWeapon _unit;
    _arr append (secondaryWeaponItems _unit) + (secondaryWeaponMagazine _unit) - [""];

    _secondaryWeaponArr pushBack ([
        '<font color="#757575" face="RobotoCondensed">',
        LLSTRING(Roster_Secondary), ': ',
        '</font>',
        getText (configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "displayName"),
        '<br/>'
    ] joinString "");
    {
        private _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
        private _picture = getText (configFile >> "CfgWeapons" >> _x >> "picture");

        if (_displayName == "" || _picture == "") then {
            _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgMagazines" >> _x >> "picture");
        };

        private _str = ['<img title="', _displayName, '" src="', _picture, '" height="64"/>  '] joinString "";
        _secondaryWeaponArr pushBack _str;
    } forEach _arr;

    _secondaryWeaponArr pushBack '<br/>';
    _secondaryWeaponText = _secondaryWeaponArr joinString "";
};

//forEach handgun Weapon + attachments
private _handgunWeaponText = "";

if (handgunWeapon _unit != "") then {
    private _handgunWeaponArr = [];
    private _arr = [];
    _arr pushBack handgunWeapon _unit;
    _arr append (handgunItems _unit) + (handgunMagazine _unit) - [""];

    _handgunWeaponArr pushBack ([
        '<font color="#757575" face="RobotoCondensed">',
        LLSTRING(Roster_Handgun), ': ',
        '</font>',
        getText (configFile >> "CfgWeapons" >> handgunWeapon _unit >> "displayName"),
        '<br/>'
    ] joinString "");

    {
        private _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
        private _picture = getText (configFile >> "CfgWeapons" >> _x >> "picture");

        if (_displayName == "" || _picture == "") then {
            _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgMagazines" >> _x >> "picture");
        };

        private _str = ['<img title="', _displayName, '" src="', _picture, '" height="32"/>  '] joinString "";
        _handgunWeaponArr pushBack _str;
    } forEach _arr;

    _handgunWeaponArr pushBack '<br/>';
    _handgunWeaponText = _handgunWeaponArr joinString "";
};

_weaponsText = [_primaryWeaponText, _secondaryWeaponText, _handgunWeaponText] joinString "";

// return
_weaponsText
