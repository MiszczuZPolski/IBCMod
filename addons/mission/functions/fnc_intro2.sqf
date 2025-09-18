#include "..\script_component.hpp"
/*
 *  Author: D.Anderson
 *  Description:
 *      Intro v2.0 from Joint Operation Stray Dog, copy cat from A4E
 *  Parametr(s):
 *      0 - _missionName: <String> - Mission name fetched from Intro 2 Module
 *      1 - _missionAuthor: <String> - Mission author fetched from Intro 2 Module
 *      2 - _missionCustomText: <String> - Diablo's Custom Text fetched from Intro 2 Module
 *      3 - _timer <Number> - Time for how long intro will be running, default 60sec.
 */

params [
    "_missionName",
    "_missionAuthor",
    "_missionCustomText",
    "_timer",
    ["_verbose", false]
];

// check timer warning
if (_timer <= 30 && is3DEN) then {
    systemChat "WARNING: Setting timer below 30 seconds can results in overlap of slides";
};

private _unit = ACE_Player;
private _clan = "Inglourious Basterds Clan";        // Hardcoded, semper gumby
private _missionCustomNameCount = 0;

[_unit, "blockRadio", "IBC_Intro", true] call ace_common_fnc_statusEffect_set;
[_unit, "blockSpeaking", "IBC_Intro", true] call ace_common_fnc_statusEffect_set;
_unit enableSimulation false;

// estimate reading time needed for custom text
if (_missionCustomText != "") then {
    if ((count _missionCustomText) >= 128) then {
        _missionCustomText = _missionCustomText select [0, 127];
    };
    // 3.33 words per second that the avg reading speed, for arma player 3.5 and round up
    _missionCustomNameCount = ceil ((count(_missionCustomText splitString " ")) / 3.5);
};

// calibrate timers
private _timerClanLogo = _timer * 0.50;
private _timerMissionInfo = _timer * 0.75;
private _timerMissionCustom = (_timer * 0.90) + _missionCustomNameCount;
private _timerEnding  = (_timer * 1.00) + (_missionCustomNameCount * 1.1);

private _timerDisplay = _timer * 0.125; // whyyyyyyy 0.125?

// black screen and loading without purpose
[
    {
        params ["_timer"];

        ["BlackAndWhite", 0.10, false] call BIS_fnc_setPPeffectTemplate;
        titleCut ["", "BLACK FADED", 999];

        // refreshing loading
        for "_i" from 1 step 3 to (floor _timer) do {
            [{
                params ["_timer", "_totalTime"];
                private _percent = floor ((_timer / _totalTime) * 100);

                private _text = [
                    "<t size='.75'>",
                    LLSTRING(IntroLoading), " ",
                    _percent,
                    "%</t>"
                ] joinString "";

                private _layer = 789 + _timer;
                [_text, -1, 1, 1.25, 0.50, 0, _layer] spawn BIS_fnc_dynamicText;
            }, [_i, _timer], _i] call CBA_fnc_waitAndExecute;
        };

        hintSilent LLSTRING(IntroControlLocked);
        [{hintSilent "";}, [], 2.5] call CBA_fnc_waitAndExecute;
    },
    [_timerClanLogo],
    1.0
] call CBA_fnc_waitAndExecute;

// clan title, logo and presets
[
    {
        params ["_clan", "_timer", "_timerDisplay", "_verbose"];

        private _text = [
            _clan,
            "<br /><br />",
            "<t size='6'>", "<img image='\z\ibc\addons\mission\images\logo512.paa' />", "</t>",
            "<br /><br />",
            LLSTRING(IntroPresents)
        ] joinString "";
        [_text, 0, 0, _timerDisplay, 0.25, 0, 788] spawn BIS_fnc_dynamicText;

        if (_verbose) then {
            systemChat format["Logo: %1 sec delay", _timer];
        };
    },
    [_clan, _timerClanLogo, _timerDisplay,  _verbose],
    _timerClanLogo
] call CBA_fnc_waitAndExecute;

// misison name, author name and stuff
[
    {
        params ["_missionName", "_author", "_timer", "_timerDisplay", "_verbose"];

        private _text = [
            "<t size='1'>",
            LLSTRING(IntroOperation),
            "</t><br /><t size='1.5'>", _missionName, "</t>",
            "<br />",
            "<t size='0.75'>by</t>",
            "<br />",
            "<t size='0.75'>", _author, "</t>"
        ] joinString "";
        [_text, -1, 0.25, _timerDisplay, 0.25, 0, 787] spawn BIS_fnc_dynamicText;

        if (_verbose) then {
            systemChat format["Logo: %1 sec delay", _timer];
        };
    },
    [_missionName, _missionAuthor, _timerMissionInfo, _timerDisplay, _verbose],
    _timerMissionInfo
] call CBA_fnc_waitAndExecute;

// Diablo's Custom Text
if (_missionCustomText != "") then {
    [
        {
            params ["_missionCustomText", "_timer", "_timerDisplay", "_verbose"];

            private _text = [
                _missionCustomText
            ] joinString "";
            [_text, -1, 0.25, _timerDisplay, 0.25, 0, 786] spawn BIS_fnc_dynamicText;

            if (_verbose) then {
                systemChat format["Logo: %1 sec delay", _timer];
            };
        },
        [_missionCustomText, _timerMissionCustom, _missionCustomNameCount, _verbose],
        _timerMissionCustom
    ] call CBA_fnc_waitAndExecute;
};

// Ending call
[
    {
        params ["_unit", "_timer", "_timerDisplay", "_verbose"];

        _unit enableSimulation true;
        [_unit, "blockRadio", "IBC_Intro", false] call ace_common_fnc_statusEffect_set;
        [_unit, "blockSpeaking", "IBC_Intro", false] call ace_common_fnc_statusEffect_set;
        [_unit, currentWeapon _unit, currentMuzzle _unit] call ace_safemode_fnc_lockSafety;

        hintSilent LLSTRING(IntroControlUnlocked);
        [{hintSilent "";}, [], 2.5] call CBA_fnc_waitAndExecute;

        ["Default", _timerDisplay, false] call BIS_fnc_setPPeffectTemplate;
        titleCut ["", "BLACK IN", 10];

        if (_verbose) then {
            systemChat format["Logo: %1 sec delay", _timer];
        };
    },
    [_unit, _timerEnding, _timerDisplay, _verbose],
    _timerEnding
] call CBA_fnc_waitAndExecute;
