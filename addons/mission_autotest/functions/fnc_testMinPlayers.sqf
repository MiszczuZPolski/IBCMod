#include "..\script_component.hpp"
/*
 * Author: TMF Team, Jonpas
 * Tests minimum players value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ibc_mission_autotest_fnc_testMinPlayers
 *
 * Public: No
 */

private _config = missionConfigFile >> "Header" >> "minPlayers";
private _value = getNumber _config; // Returns 0 even if not set
if (!isNumber _config) then {
    // getMissionConfigValue does not work (even though attribute name is same)
    _value = "Multiplayer" get3DENMissionAttribute "MinPlayers";
};

private _playerCount = count playableUnits;

if (_value >= 0 && {_value <= _playerCount}) then {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (str _value);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _value, localize LSTRING(ShouldBe), _playerCount]);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
};
