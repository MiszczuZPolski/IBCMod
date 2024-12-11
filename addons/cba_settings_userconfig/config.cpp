#include "script_component.hpp"

class CfgPatches {
    class cba_settings_userconfig {
        name = COMPONENT_NAME;

        author = "MiszczuZPolski";
        authors[] = {"MiszczuZPolski"};

        VERSION_CONFIG;

        requiredAddons[] = {"cba_main", "ibc_main"};

        units[] = {};
        weapons[] = {};
    };
};
