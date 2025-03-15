#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ibc_main"};
        author = "FreestyleBuild";
        VERSION_CONFIG;
    };
};


#include "CfgEventHandlers.hpp"
