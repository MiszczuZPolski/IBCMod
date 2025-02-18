#include "..\script_component.hpp"

if (GVAR(screenshotMode)) then {
    // Load State
    GVAR(screenshotModeOldState) params ["_ace", "_dui", "_indicators", "_staminaBar", "_stamina", "_nametags"];

    // Restore UI
    ["hideHud", _ace] call ace_common_fnc_showHud;
    diwako_dui_main_toggled_off = _dui;
    diwako_dui_indicators_show = _indicators;
    _staminaBar ctrlShow _stamina;
    ace_nametags_show_playernames = _nametags;

    GVAR(screenshotMode) = false;
} else {
    // Save Current State
    private _ace = [] call ace_common_fnc_showHud;
    private _dui = diwako_dui_main_toggled_off;
    private _indicators = diwako_dui_indicators_show;

    private _staminaBar = uiNamespace getVariable ["ace_advanced_fatigue_staminaBarContainer", controlNull];
    private _stamina = ctrlShown _staminaBar;
    private _nametags = ace_nametags_showplayernames;

    ["hideHud", [false, false, false, false, false, false, false, false]] call ace_common_fnc_showHud;
    diwako_dui_main_toggled_off = true;
    diwako_dui_indicators_show = false;
    _staminaBar ctrlShow false;
    ace_nametags_show_playernames = 0;

    GVAR(screenshotModeOldState) = [_ace, _dui, _indicators, _staminaBar, _stamina, _nametags];
    GVAR(screenshotMode) = true;
};
