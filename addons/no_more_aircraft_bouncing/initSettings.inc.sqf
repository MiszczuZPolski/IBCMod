[
    QGVAR(pfxHelicopters), "CHECKBOX",
    [LSTRING(SettingName_pfxHelicopters), LSTRING(SettingInfo_pfxhelicopters)],
    [LSTRING(Title), LSTRING(SettingCategory_ParticleEffects)],
    true,
    false,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(pfxPlanes), "CHECKBOX",
    [LSTRING(SettingName_pfxPlanes), LSTRING(SettingInfo_pfxPlanes)],
    [LSTRING(Title), LSTRING(SettingCategory_ParticleEffects)],
    true,
    false,
    {},
    false
] call CBA_fnc_addSetting;
