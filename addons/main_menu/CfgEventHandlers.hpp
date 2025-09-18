class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class RscDisplayPassword {
    ADDON = QUOTE(with uiNamespace do {\
        [_this select 0] call COMPILE_SCRIPT(XEH_displayPassword);\
    });
};

class RscMsgBox {
    ADDON = QUOTE(with uiNamespace do {\
        [_this select 0] call COMPILE_SCRIPT(XEH_msgBox);\
    });
};

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayRemoteMissions {
        ADDON = QUOTE(with uiNamespace do {\
            ARR_2([_this select 0,'RscDisplayRemoteMissions']) call COMPILE_FILE(XEH_multiplayerDisplay);\
        });
    };
    class RscDisplayMultiplayerSetup {
        ADDON = QUOTE(with uiNamespace do {\
            ARR_2([_this select 0,'RscDisplayMultiplayerSetup']) call COMPILE_FILE(XEH_multiplayerDisplay);\
        });
    };
};
