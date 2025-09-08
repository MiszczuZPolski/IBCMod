#define COMPONENT main_menu
#include "\z\ibc\addons\main\script_mod.hpp"

#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineResincl.inc"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_MAIN_MENU
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_MAIN_MENU
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MAIN_MENU
#endif

#include "\z\ibc\addons\main\script_macros.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"

#define IDC_SERVERSTATUS_TITLE 1000
#define IDC_SERVERSTATUS_DESCRIPTION 1001
#define IDC_SERVERSTATUS_PASSWORD 1002
#define IDC_SERVERSTATUS_LOGIN 1003
#define IDC_SERVERSTATUS_MISSIONS 1004
#define IDC_MSGBOX_TEXT 1005
