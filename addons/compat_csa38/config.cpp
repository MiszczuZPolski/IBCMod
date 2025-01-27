#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;

        author = "MiszczuZPolski";
        authors[] = {"MiszczuZPolski"};

        VERSION_CONFIG;

        requiredAddons[] = {"CSA38II_data", "ibc_main"};
        skipWhenMissingDependencies = 1;

        units[] = {};
        weapons[] = {};
    };
};

#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
