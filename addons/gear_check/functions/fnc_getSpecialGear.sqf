#include "..\script_component.hpp"


params ["_unit", ["_returnClasses", false]];

private _roles = [_unit] call FUNC(findRoles);
if (_roles isEqualTo []) exitWith {[]};

private _unitItems = uniqueUnitItems [_unit, 0, 2, 2, 2, true];

private _missing = [];
private _missingClasses = [];

{
    switch (tolower _x) do {
        case "medic": {
            [["ACE_epinephrine"], _unitItems,       2, "Epinefryny", _missing, _missingClasses] call FUNC(countItem);
            [["ACE_morphine"], _unitItems,          2, "Morfiny", _missing, _missingClasses] call FUNC(countItem);
            [["ACE_elasticBandage"], _unitItems,    30, "Bandaży elastycznych", _missing, _missingClasses] call FUNC(countItem);
            [["ACE_plasmaIV"], _unitItems,          3, "Osocze IV (1000ml)", _missing, _missingClasses] call FUNC(countItem);
            [["ACE_plasmaIV_500"], _unitItems,      6, "Osocze IV (500ml)", _missing, _missingClasses] call FUNC(countItem);
            [["ACE_plasmaIV_250"], _unitItems,      4, "Osocze IV (250ml)", _missing, _missingClasses] call FUNC(countItem);
            [["ACE_splint"], _unitItems,            5, "Szyn", _missing, _missingClasses] call FUNC(countItem);
            [["ACE_tourniquet"], _unitItems,        8, "Staz", _missing, _missingClasses] call FUNC(countItem);
            [["ACE_surgicalKit"], _unitItems,       1, "Zestaw do szycia ran", _missing, _missingClasses] call FUNC(countItem);
        };
        case "engineer": {
            [["ACE_wirecutter"], _unitItems,        1, "Wirecutter", _missing] call FUNC(countItem);
            [["ACE_EntrenchingTool"], _unitItems,   1, "Entrenching Tool", _missing] call FUNC(countItem);
            [["ToolKit"], _unitItems,               1, "Toolkit", _missing] call FUNC(countItem);
            [["DemoCharge_Remote_Mag"], _unitItems, 2, "M112 Demo Block", _missing] call FUNC(countItem);
            [["ACE_rope3","ACE_rope6"], _unitItems, 2, "Rope", _missing] call FUNC(countItem);
        };
        case "eod": {
            [["ACE_Clacker", "ACE_M26_Clacker"], _unitItems,    1, "Clacker", _missing, _missingClasses] call FUNC(countItem);
            [["ACE_DefusalKit"], _unitItems,                    1, "Defusal Kit", _missing, _missingClasses] call FUNC(countItem);
            [["ACE_wirecutter"], _unitItems,                    1, "Wirecutter", _missing, _missingClasses] call FUNC(countItem);
            [["DemoCharge_Remote_Mag"], _unitItems,             2, "M112 Demo Block", _missing, _missingClasses] call FUNC(countItem);
            [["ace_marker_flags_green"], _unitItems,            5, "Marker Flag (Green)", _missing, _missingClasses]  call FUNC(countItem);
            [["ace_marker_flags_red"], _unitItems,              5, "Marker Flag (Red)", _missing, _missingClasses]   call FUNC(countItem);

            if !(handgunWeapon _unit in ["ACE_VMH3", "ACE_VMM3"]) then {
                _missing pushBackUnique "Mine Detector";
                _missingClasses pushBackUnique ["#item", ["ACE_VMH3", "ACE_VMM3"], 1];
            };
        };
        case "signaller": {
            [["ACE_Chemlight_HiRed"], _unitItems,      3, "Chemlight (Hi Red)", _missing] call FUNC(countItem);
            [["ACE_Chemlight_HiGreen"], _unitItems,    3, "Chemlight (Hi Green)", _missing] call FUNC(countItem);
            [["ACE_Chemlight_HiYellow"], _unitItems,   6, "Chemlight (Hi Yellow)", _missing] call FUNC(countItem);
            [["ACE_HandFlare_Green"], _unitItems,      2, "Hand Flare (Green)", _missing] call FUNC(countItem);
            [["ACE_HandFlare_Red"], _unitItems,        2, "Hand Flare (Red)", _missing] call FUNC(countItem);
            [["ACE_HandFlare_Yellow"], _unitItems,     4, "Hand Flare (Yellow)", _missing] call FUNC(countItem);
            [["SmokeShellOrange"], _unitItems,         2, "Smoke Shell (Orange)", _missing] call FUNC(countItem);
        };
        case "ol";
        case "el";
        case "ftl": {
            [["ACRE_PRC152", "ACRE_PRC117F"], _unitItems, 1, "AN/PRC-152", _missing] call FUNC(countItem);
        };
        case "sl": {
            [["ACRE_PRC152", "ACRE_PRC117F"], _unitItems, 2, "AN/PRC-152", _missing] call FUNC(countItem);
        };
        default { };
    };
} forEach _roles;

if (_missing isNotEqualTo []) then {
    _missing insert [0, ["Missing Special Gear:"]];
};

[_missing, _missingClasses] select _returnClasses
