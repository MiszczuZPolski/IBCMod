#include "..\script_component.hpp"
/*
 * Author: TMF Team, Jonpas
 * Tests mission name value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ibc_mission_autotest_fnc_testName
 *
 * Public: No
 */

private _value = getMissionConfigValue ["onLoadName", ""];
if (_value == "") then {
    _value = "Scenario" get3DENMissionAttribute "IntelBriefingName";
};

private _picture = [PASS_PICTURE, ERROR_PICTURE] select (_value == "");

(_this controlsGroupCtrl CTRL_VALUE) ctrlSetText _value;
(_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText _picture;
