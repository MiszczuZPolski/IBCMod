#define COMPONENT mission_autotest
#define COMPONENT_BEAUTIFIED Mission Autotest
#include "\z\ibc\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MISSION_AUTOTEST
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MISSION_AUTOTEST
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSION_AUTOTEST
#endif

#include "\z\ibc\addons\main\script_macros.hpp"


#define ERROR_CODE -1
#define WARNING_CODE 0
#define PASS_CODE 1
#define MESSAGE_CODE 2

#define ERROR_PICTURE QPATHTOF(UI\error.paa)
#define WARNING_PICTURE QPATHTOF(UI\warning.paa)
#define PASS_PICTURE QPATHTOF(UI\pass.paa)
#define MESSAGE_PICTURE QPATHTOF(UI\message.paa)

#define CTRL_VALUE 100
#define CTRL_PICTURE 101
#define FINDINGS_COLUMN_SIZE 0, 0.05

// Limits
#define INIT_SIZE_WARNING 5
#define INIT_SIZE_ERROR 50
#define GROUP_SIZE_WARNING 250
#define GROUP_UNIT_LIMIT 10
#define AI_AMOUNT_WARNING 200
#define AI_AMOUNT_ERROR 300
#define AP_AMOUNT_WARNING 6
#define AP_AMOUNT_ERROR 10
#define APC_AMOUNT_WARNING 4
#define APC_AMOUNT_ERROR 6
#define TRACKED_AMOUNT_WARNING 2
#define TRACKED_AMOUNT_ERROR 4
#define HC_AMOUNT_RECOMMENDED_MIN 1
#define HC_AMOUNT_RECOMMENDED_MAX 3
#define RESPAWN_MODE_RECOMMENDED 3
#define RESPAWN_DELAY_MIN_RECOMMENDED 2
#define RESPAWN_DELAY_MAX_RECOMMENDED 10

#define RESPAWN_MODES ["NONE", "BIRD", "INSTANT", "BASE", "GROUP", "SIDE"]
#define MESSAGE_LENGTH 85