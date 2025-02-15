#include "..\script_component.hpp"

private _state = GVAR(screenshotMode);

// Hide UI
if (!_state) then {
    call FUNC(screenshotMode);
};

[{
    _this spawn {
        _this params ["_state"];
        sleep 0.3;
        EXT callExtension ["screenshot", []];
        sleep 0.3;
        if (!_state) then {
            call FUNC(screenshotMode);
        };
    };
}, [_state]] call CBA_fnc_execNextFrame;
