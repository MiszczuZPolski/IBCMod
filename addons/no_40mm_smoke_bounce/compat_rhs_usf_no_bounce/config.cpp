#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ibc_main", "rhsusf_main_loadorder"};
        skipWhenMissingDependencies = 1;
        author = "MiszczuZPolski";
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
