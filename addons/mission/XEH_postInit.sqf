#include "script_component.hpp"

// Exit if not player client
if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
    call FUNC(initRoster);
}] call CBA_fnc_addEventHandler;

["featureCamera", {
    if !GVAR(checkArsenal) exitWith {};

    params ["_unit", "_camera"];

    private _uid = getPlayerUID _unit;
    private _whitelist = GVAR(whitelistArsenal) splitString ",";
    private _zero_based_position = _whitelist findIf {_x == _uid};
    private _error = "";
    private _unitName = [_unit, false, true] call ACEFUNC(common,getName);
    private _activeCamera = call CBA_fnc_getActiveFeatureCamera;

    if (_zero_based_position == -1) then {

        switch (_activeCamera) do {
            case "ace_arsenal": {
                _error = format ["Gracz: %1 próbował skorzystać z ACE Arsenału", _unitName];
            };
            case "arsenal": {
                _error = format ["Gracz: %1 próbował skorzystać z Arsenału", _unitName];
            };
            case "splendid": {
                _error = format ["Gracz: %1 próbował skorzystać z Kamery Obserwatora", _unitName];
            };
            case "curator": {
                _error = format ["Gracz: %1 próbował skorzystać z ZEUSA", _unitName];
            };
        };
        if (_error != "") then {
            [QACEGVAR(common,systemChatGlobal), _error] call CBA_fnc_globalEvent;
        };
    };

}] call CBA_fnc_addPlayerEventHandler;
