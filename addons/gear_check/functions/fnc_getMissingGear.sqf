#include "..\script_component.hpp"

#define DEFAULT_UNIFORM QUOTE(U_I_G_resistanceLeader_F)
#define DEFAULT_VEST QUOTE(V_PlateCarrier1_rgr)
#define DEFAULT_RIFLE QUOTE(arifle_MX_F)
#define DEFAULT_PISTOL QUOTE(hgun_P07_F)

params ["_unit", ["_returnClasses", false]];

if (!GVAR(enabled)) exitWith {[]};

if (!isPlayer _unit) exitWith {[]};

private _roles = [_unit] call FUNC(findRoles);

private _unitItems = uniqueUnitItems [_unit, 0, 2, 2, 2, true];
if ("acre_api" call ACEFUNC(common,isModLoaded)) then {
    {
        private _baseRadio = _x call acre_api_fnc_getBaseRadio;
        private _count = _unitItems get _x;
        _unitItems set [_baseRadio, (_unitItems getOrDefault [_baseRadio, 0]) + _count];
        if (_x != _baseRadio) then {
            _unitItems deleteAt _x;
        };
    } forEach ((keys _unitItems) select {_x call acre_api_fnc_isRadio});
};

private _missing = [];
private _missingClasses = [];

if (uniform _unit isEqualTo "") then {
    _missing pushBack "Mundur";
    _missingClasses pushBack ["#uniform", [DEFAULT_UNIFORM], 1];
};

if (GVAR(requireVest) && {vest _unit isEqualTo ""}) then {
    _missing pushBack "Kamizelka kuloodporna";
    _missingClasses pushBack ["#vest", [DEFAULT_VEST], 1];
};

// Check for a weapon
if (GVAR(requirePrimary)) then {
    private _weapon = primaryWeapon _unit;
    private _missingRifle = false;
    if (_weapon isEqualTo "") then {
        _missing pushBack "Broń główna";
        _missingClasses pushBack ["#weapon", [DEFAULT_RIFLE], 1];
        _missingRifle = true;
    };
    private _rounds = 0;
    {
        if (_weapon canAdd (_x#0)) then {
            _rounds = _rounds + _x#1;
        };
    } forEach magazinesAmmoFull _unit;
    if (_rounds < GVAR(requirePrimaryAmmo)) then {
        _missing pushBack format ["%1 naboi do broni głównej", GVAR(requirePrimaryAmmo) - _rounds];
        if (!_missingRifle) then {
            _missingClasses pushBack ["#magazine", primaryWeaponMagazine _unit, GVAR(requirePrimaryAmmo) - _rounds, _weapon];
        };
    };
};

if (GVAR(requireHandgun)) then {
    private _weapon = handgunWeapon _unit;
    private _missingPistol = false;
    if (_weapon isEqualTo "") then {
        _missing pushBack "Pistolet";
        _missingClasses pushBack ["#weapon", [DEFAULT_PISTOL], 1];
        _missingPistol = true;
    };
    private _rounds = 0;
    {
        if (_weapon canAdd (_x#0)) then {
            _rounds = _rounds + _x#1;
        };
    } forEach magazinesAmmoFull _unit;
    if (_rounds < GVAR(requireHandgunAmmo)) then {
        _missing pushBack format ["%1 naboi do pistoletu", GVAR(requireHandgunAmmo) - _rounds];
        if (!_missingPistol) then {
            _missingClasses pushBack ["#magazine", handgunMagazine _unit, GVAR(requireHandgunAmmo) - _rounds, _weapon];
        };
    };
};

if (binocular _unit != "" && {binocularMagazine _unit isEqualTo []} && {([binocular _unit] call CBA_fnc_compatibleMagazines) isNotEqualTo []}) then {
    _missing pushBack "Baterie do wskażnika laserowego";
    _missingClasses pushBack ["#binoammo", [binocular _unit] call CBA_fnc_compatibleMagazines, 1];
};

if (GVAR(requireEarplugs) && {ACEGVAR(hearing,damageCoefficent) > 0.6 && !("ACE_EarPlugs" in _unitItems)}) then {
    _missing pushBack "Earplugs";
    _missingClasses pushBack ["#item", ["ACE_EarPlugs"], 1];
};

if (GVAR(requireRadio)) then {
    [["ACRE_PRC152"], _unitItems, 1, ["AN/PRC-152", "AN/PRC-152"], _missing, _missingClasses] call FUNC(countItem);
};

[["ACE_fieldDressing","ACE_packingBandage"], _unitItems,
                                      15, ["Bandaż", "Bandaże"], _missing, _missingClasses] call FUNC(countItem);
[["ACE_splint"], _unitItems,           2, ["Szyna", "Szyny"], _missing, _missingClasses] call FUNC(countItem);
[["ACE_morphine"], _unitItems,         2, ["Morfina", "Morfiny"], _missing, _missingClasses] call FUNC(countItem);
[["ACE_epinephrine"], _unitItems,      1, ["Epinefryna", "Epinefryn"], _missing, _missingClasses] call FUNC(countItem);
[["ACE_tourniquet"], _unitItems,       4, ["Staza", "Stazy"], _missing, _missingClasses] call FUNC(countItem);
[["SmokeShell"], _unitItems,           2, ["Granat dymny", "Granaty dymne"], _missing, _missingClasses] call FUNC(countItem);


if (GVAR(requireNVG) && {(hmd _unit) == ""}) then {
    _missing pushBack "NVGs";
    _missingClasses pushBack ["#belt", ["ACE_NVG_Wide"], 1];
};

if ((_unit getSlotItemName SLOT_MAP) isEqualTo "") then {
    _missing pushBack "Mapa";
    _missingClasses pushBack ["#belt", ["ItemMap"], 1];
};

if ((_unit getSlotItemName SLOT_GPS) isEqualTo "") then {
    _missing pushBack "GPS";
    _missingClasses pushBack ["#belt", ["ItemGPS"], 1];
};

if ((_unit getSlotItemName SLOT_COMPASS) isEqualTo "") then {
    _missing pushBack "Kompas";
    _missingClasses pushBack ["#belt", ["ItemCompass"], 1];
};

if ((_unit getSlotItemName SLOT_WATCH) isEqualTo "") then {
    _missing pushBack "Zegarek";
    _missingClasses pushBack ["#belt", ["ItemWatch"], 1];
};

if (GVAR(requireShovel) && {!("ACE_EntrenchingTool" in _unitItems)}) then {
    _missing pushBack "Saperka";
    _missingClasses pushBack ["#item", ["ACE_EntrenchingTool"], 1];
};

if (_missing isNotEqualTo []) then {
    _missing insert [0, ["Brakujące wyposażenie podstawowe:"]];
};

[_missing, _missingClasses] select _returnClasses
