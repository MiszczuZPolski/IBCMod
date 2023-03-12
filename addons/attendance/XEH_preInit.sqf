#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
    [QGVAR(markAttendance),{
        params ["_playerID", "_playerName"];

        if (IS_ATTENDANCE_LOGGED(_playerID)) exitWith{};
        SET_ATTENDANCE_LOGGED(_playerID);

        private _msg = format ["Nickname: %1, SteamID: %2", _playerName, _playerID];
        WARNING(_msg);
    }] call CBA_fnc_addEventHandler;
};

ADDON = true;
