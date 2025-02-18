#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ibc_main",
            "A3_Sounds_F_Enoch"
        };
        author = "MiszczuZPolski";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
