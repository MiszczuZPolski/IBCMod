#include "script_component.hpp"


["Air", "Killed", LINKFUNC(killed)] call CBA_fnc_addClassEventHandler;
[QGVAR(triggered), LINKFUNC(particles)] call CBA_fnc_addEventHandler;
