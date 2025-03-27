#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _exclusions = (QUOTE(getNumber (_x >> QQGVAR(exclude)) > 0) configClasses (configFile >> "CfgVehicles") apply {configName _x});
uiNamespace setVariable [QGVAR(excluded), compileFinal (_exclusions createHashMapFromArray [])];
