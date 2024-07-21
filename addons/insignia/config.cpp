#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ibc_main"
        };
        author = "MiszczuZPolski";
        VERSION_CONFIG;
    };
};

#include "CfgUnitInsignia.hpp"
