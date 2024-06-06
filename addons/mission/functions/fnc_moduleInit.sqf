#include "..\script_component.hpp"
/*
 * Author: MiszczuZPolski
 * Initializes intro module
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

// Extract mission name
private _missionName = _logic getVariable "MissionName";

//Extract mission author
private _missionAuthor = _logic getVariable "MissionAuthor";

// Extract timer
private _time = _logic getVariable "Timer";
private _timer = parseNumber _time;

//Extract custom text
private _customText = _logic getVariable "CustomText";

// Extract terrain
private _terrain = _logic getVariable "Terrain";

[_missionName, _missionAuthor, _timer, _customText, _terrain] spawn FUNC(introDialog);
