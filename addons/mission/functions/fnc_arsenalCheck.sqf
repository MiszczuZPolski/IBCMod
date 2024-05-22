#include "..\script_component.hpp"
params ["_camera"];

private _uid = getPlayerUID ACE_player;
private _zero_based_position = GVAR(allowedArsenal) findIf {_x == _uid};
private _error = "";
private _unitName = [ACE_player, false, true] call ACEFUNC(common,getName);
if (_zero_based_position == -1) then {

    switch (_camera#1) do {
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
    ["ace_common_systemChatGlobal", _error] call CBA_fnc_globalEvent;
};
