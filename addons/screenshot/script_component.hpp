#define COMPONENT screenshot
#define COMPONENT_BEAUTIFIED Screenshot
#include "..\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_SCREENSHOT
    #define DEBUG_MODE_FULL
#endif
#ifdef DEBUG_SETTINGS_OTHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SCREENSHOT
#endif

#include "..\main\script_macros.hpp"
