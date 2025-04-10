class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
    };
};


class Extended_InitPost_EventHandlers {
    class Air {
        class ADDON {
            init = QUOTE([_this select 0] call FUNC(setup));
            exclude[] = {QUOTE(ParachuteBase), QUOTE(UAV), QUOTE(UAV_01_base_F)};
        };
    };
};
