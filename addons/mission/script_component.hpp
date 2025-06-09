#define COMPONENT mission
#define COMPONENT_BEAUTIFIED Mission
#include "\z\ibc\addons\main\script_mod.hpp"

#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineResincl.inc"
#include "\a3\ui_f\hpp\defineResinclDesign.inc"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MISSION
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MISSION
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSION
#endif

#include "\z\ibc\addons\main\script_macros.hpp"
