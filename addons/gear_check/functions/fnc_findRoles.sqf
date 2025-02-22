#include "..\script_component.hpp"
params ["_unit"];

private _roles = [];

private _role = _unit getVariable [QGVAR(roles), []];

{
    _roles pushBackUnique _x;
} forEach _role;

_roles
