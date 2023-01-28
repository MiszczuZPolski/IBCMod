#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ibc_main"
        };
        author = "ArmaForces";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\RscModal.hpp"
