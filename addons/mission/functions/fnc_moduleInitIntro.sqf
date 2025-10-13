#include "..\script_component.hpp"
/*
 * Author: D.Anderson
 * Initializes Intro module
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY> (unused)
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

// Exit on Headless Client
if (!hasInterface && !isDedicated) exitWith {};

params ["_logic", "", "_activated"];

if (!_activated) exitWith {};
if (isNull _logic) exitWith {};

// Extract Mission Name
private _missionName = _logic getVariable "MissionName";

// Extract Mission Author
private _missionAuthor = _logic getVariable "MissionAuthor";

// Extract Diablo's Custom Text
private _missionCustomText = _logic getVariable "MissionCustomText";

// Extract Timer
private _time = _logic getVariable "Timer";
private _timer = parseNumber _time;

[_missionName, _missionAuthor, _missionCustomText, _timer] spawn FUNC(intro);
