#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"proj_templ_main"};
        author = "";
        authors[] = {""};
    };
};

#include "CfgEventHandlers.hpp"
