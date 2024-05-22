#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = "IBC Mission Settings";

[
    QGVAR(checkArsenal),
    "CHECKBOX",
    [LLSTRING(Setting_Enable), LLSTRING(Setting_Enable_Description)],
    _category,
    true
] call CBA_fnc_addSetting;

ADDON = true;
