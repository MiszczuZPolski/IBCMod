[
    QGVAR(enabled),
    "CHECKBOX",
    "Require Equipment",
    ["IBC Arsenal", "Arsenal - Gear Check"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requirePrimary),
    "CHECKBOX",
    "Primary Weapon",
    ["IBC Arsenal", "Arsenal - Gear Check"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requirePrimaryAmmo),
    "SLIDER",
    "Primary Ammunition",
    ["IBC Arsenal", "Arsenal - Gear Check"],
    [0, 300, 120, 0, false],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(requireHandgun),
    "CHECKBOX",
    "Handgun Weapon",
    ["IBC Arsenal", "Arsenal - Gear Check"],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(requireHandgunAmmo),
    "SLIDER",
    "Handgun Ammunition",
    ["IBC Arsenal", "Arsenal - Gear Check"],
    [0, 150, 0, 0, false],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(requireVest),
    "CHECKBOX",
    "Vest",
    ["IBC Arsenal", "Arsenal - Gear Check"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requireNVG),
    "CHECKBOX",
    "NVG",
    ["IBC Arsenal", "Arsenal - Gear Check"],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(requireRadio),
    "CHECKBOX",
    "Radio",
    ["IBC Arsenal", "Arsenal - Gear Check"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requireShovel),
    "CHECKBOX",
    "Entrenching Tool",
    ["IBC Arsenal", "Arsenal - Gear Check"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(requireEarplugs),
    "CHECKBOX",
    "Ear Plugs",
    ["IBC Arsenal", "Arsenal - Gear Check"],
    true
] call CBA_fnc_addSetting;
