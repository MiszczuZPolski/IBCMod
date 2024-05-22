#include "..\script_component.hpp"
/*
 *	Author: D.Anderson
 *	Description:
 *		Display fancy Mission Start screen and plays with Post Processing
 *		to make mission start bit more dramatic for not good reason.
 *		Wanna use it? Link to downloadable version:
 *		https://github.com/dAnders0n/fancy-mission-start/tree/master/fancy_mission_start.VR
 *	Parametr(s):
 *		0 - _unit: <Object> - must by player.
 *		1 - _time: <Number> - startup time.
 *		2 - _image: <String> - patch to image.
 *		3 - _customText: <String> - Custom text displayed on botton.
 */

disableSerialization;
params ["_time", "_customText", "_terrain"];
["BlackAndWhite", 0.25, false] call BIS_fnc_setPPeffectTemplate;
sleep 0.5;
createDialog QGVAR(introDialog);

waitUntil {!isNull (findDisplay 9001)};

_missionName = getMissionConfigValue "OnLoadName";
_author = getMissionConfigValue "author";
_roleDesc = roleDescription ACE_player;
_unitGroup = groupId (group ACE_player);


/****************************************************************/

[_time] spawn FUNC(introDialogCD);

ACE_player enableSimulation false;
[ACE_player, "blockRadio", "IBC_Intro", true] call ace_common_fnc_statusEffect_set;
[ACE_player, "blockSpeaking", "IBC_Intro", true] call ace_common_fnc_statusEffect_set;

//Logo
private _image = QPATHTOF(images\logo512.paa);
_ctrl = (findDisplay 9001) displayCtrl 1200;
ctrlSetText[1200, _image];
/****************************************************************/

//Mission Name
_ctrl = (findDisplay 9001) displayCtrl 1100;
_str = ['<t size="2.0" align="center" valign="middle">',_missionName, '</t>'] joinString "";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/

// Terrain
_ctrl = (findDisplay 9001) displayCtrl 1101;

_str = ['<t valign="middle">Lokalizacja:',_terrain, '</t>'] joinString " ";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/

// Author
_ctrl = (findDisplay 9001) displayCtrl 1102;

_str = ['<t valign="middle">by', _author, '</t>'] joinString " ";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/


// Role Descriotion
_ctrl = (findDisplay 9001) displayCtrl 1103;

_roleDescArray = _roleDesc splitString "@";
_slotName = (_roleDescArray select 0) splitString ":";

_count = count _slotName;
if (_count > 1) then {
    _str = ['<t valign="middle">Slot:', _slotName select 1, '</t>'] joinString "";
} else {
    _str = ['<t valign="middle">Slot:', _slotName select 0, '</t>'] joinString " ";
};

_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/

//Group Name
_ctrl = (findDisplay 9001) displayCtrl 1104;

_str = ['<t valign="middle">Przydział:', _unitGroup, '</t>'] joinString " ";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/

//Custom Text
_ctrl = (findDisplay 9001) displayCtrl 1105;

_str = ['<t align="center" valign="middle">',_customText, '</t>'] joinString "";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";

sleep _time;

_array = [1200, 1100, 1101, 1102, 1103, 1104, 1105];

["Default", 7, false] call BIS_fnc_setPPeffectTemplate;
{
	_ctrl = (findDisplay 9001) displayCtrl _x;
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 7;
} forEach _array;

sleep 7;
hint parseText "Misja rozpoczyna się!<br /> Symulacja gracza: <t color='#ff0000'>Włączona</t><br /> Powodzenia!";
sleep 0.5;
[ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_lockSafety;
[ACE_player] call ace_weaponselect_fnc_putWeaponAway;
[ACE_player, "blockRadio", "IBC_Intro", false] call ace_common_fnc_statusEffect_set;
[ACE_player, "blockSpeaking", "IBC_Intro", false] call ace_common_fnc_statusEffect_set;
ACE_player enableSimulation true;
closeDialog 1;
sleep 2.5;
hint "";
/****************************************************************/
