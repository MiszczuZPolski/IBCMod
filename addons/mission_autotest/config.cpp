#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ibc_main"};
        author = ECSTRING(main,Author);
        authors[] = {"TMF Team", "Jonpas"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgEden.hpp"
#include "displayEden.hpp"
