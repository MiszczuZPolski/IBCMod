#include "..\script_component.hpp"
/*
 *  Author: D.Anderson
 *  Description:
 *      Intro v2.0 from Joint Operation Stray Dog, copy cat from A4E
 *  Parametr(s):
 *      0 - _missionName: <String> - Mission name fetched from Intro 2 Module
 *      1 - _missionAuthor: <String> - Mission author fetched from Intro 2 Module
 *      2 - _timer <Number> - Time for how long intro will be running, default 60sec.
 */

params [
    "_missionName",
    "_missionAuthor",
    "_timer",
    ["_verbose", false]
];

private _unit = ACE_Player;
private _clan = "Inglourious Basterds Clan";        // Hardcoded, semper gumby

[_unit, "blockRadio", "IBC_Intro", true] call ace_common_fnc_statusEffect_set;
[_unit, "blockSpeaking", "IBC_Intro", true] call ace_common_fnc_statusEffect_set;
_unit enableSimulation false;

// calibrate timers
private _timer1 = _timer * 0.42;
private _timer2 = _timer * 0.60;
private _timer3 = _timer * 0.75;
private _timer4 = _timer * 0.90;
private _timer_display = _timer * 0.125;

[{
    params ["_timer"];

    ["BlackAndWhite", 0.10, false] call BIS_fnc_setPPeffectTemplate;
    titleCut ["", "BLACK FADED", 999];
    private _text = [
        "<t size='.75'>",
        LLSTRING(IntroLoading),
        "...</t>"
    ] joinString "";
    [_text, -1, 1, (_timer * 0.75), 0.25, 0, 789] spawn BIS_fnc_dynamicText;
    hintSilent LLSTRING(IntroControlLocked);
    [{hintSilent "";}, [], 2.5] call CBA_fnc_waitAndExecute;
}, [_timer1], 1.0] call CBA_fnc_waitAndExecute;

[{
    params ["_clan", "_timer", "_timer_display", "_verbose"];

    private _text = [
        _clan,
        "<br />",
        "<t size='9'>", "<img image='\z\ibc\addons\mission\images\logo512.paa' />", "</t>"
    ] joinString "";
    [_text, 0, 0, _timer_display, 0.25, 0, 788] spawn BIS_fnc_dynamicText;
    //["resources\ibc_logo.paa",[0, 0.0, 0.5, 0.625], 10, 4.5] spawn BIS_fnc_textTiles;
    if (_verbose) then {
        systemChat format["Logo: %1 sec delay", _timer];
    };
},
[_clan, _timer1, _timer_display,  _verbose],
_timer1] call CBA_fnc_waitAndExecute;

[{
    params ["_timer", "_timer_display", "_verbose"];

    [LLSTRING(IntroPresents), -1, -1,_timer_display, 0.25, 0, 789] spawn BIS_fnc_dynamicText;
    if (_verbose) then {
        systemChat format["Logo: %1 sec delay", _timer];
    };
},
[_timer2, _timer_display, _verbose],
_timer2] call CBA_fnc_waitAndExecute;

[{
    params ["_missionName", "_author", "_timer", "_timer_display", "_verbose"];

    private _text = [
        "<t size='1'>",
        LLSTRING(IntroOperation),
        "</t><br /><t size='1.5'>", _missionName, "</t>",
        "<br />",
        "<t size='0.75'>by ", _author, "</t>"
    ] joinString "";
    [_text, -1, -1, _timer_display, 0.25, 0, 788] spawn BIS_fnc_dynamicText;
    if (_verbose) then {
        systemChat format["Logo: %1 sec delay", _timer];
    };
},
[_missionName, _missionAuthor, _timer3, _timer_display, _verbose],
_timer3] call CBA_fnc_waitAndExecute;

[{
    params ["_unit", "_timer", "_timer_display", "_verbose"];

    _unit enableSimulation true;
    [_unit, "blockRadio", "IBC_Intro", false] call ace_common_fnc_statusEffect_set;
    [_unit, "blockSpeaking", "IBC_Intro", false] call ace_common_fnc_statusEffect_set;
    [_unit, currentWeapon _unit, currentMuzzle _unit] call ace_safemode_fnc_lockSafety;

    hintSilent LLSTRING(IntroControlUnlocked);
    [{hintSilent "";}, [], 2.5] call CBA_fnc_waitAndExecute;

    ["Default", _timer_display, false] call BIS_fnc_setPPeffectTemplate;
    titleCut ["", "BLACK IN", 10];
    if (_verbose) then {
        systemChat format["Logo: %1 sec delay", _timer];
    };
},
[_unit, _timer4, _timer_display, _verbose],
_timer4] call CBA_fnc_waitAndExecute;
