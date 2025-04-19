#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;

        author = "MiszczuZPolski";
        authors[] = {"MiszczuZPolski"};

        VERSION_CONFIG;

        requiredAddons[] = {"ibc_main"};

        units[] = {};
        weapons[] = {};
    };
};

#include "CfgAmmo.hpp"
