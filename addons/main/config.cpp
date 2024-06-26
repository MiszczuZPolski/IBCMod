#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main"
        };
        author = "MiszczuZPolski";
        VERSION_CONFIG;
    };
};

#include "CfgEden.hpp"
#include "CfgEditorCategories.hpp"
#include "CfgModuleCategories.hpp"
#include "CfgSettings.hpp"
#include "CfgVehicleClasses.hpp"
#include "displayEden.hpp"
