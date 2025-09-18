class CfgVehicles {
    class ACE_Module;
    class GVAR(Intro): ACE_Module {
        author = ECSTRING(main,Author);
        category = "IBC";
        displayName = "Intro";
        function = QFUNC(moduleInitIntro);
        scope = 2;
        isGlobal = 1; // Global
        isTriggerActivated = 0;
        isDisposable = 0;
        icon = "\a3\ui_f\data\gui\cfg\hints\icon_text\group_1_ca.paa";
        class Arguments {
            class MissionName {
                displayName = CSTRING(MissionName);
                description = CSTRING(MissionName_Desc);
                typeName = "STRING";
                defaultValue = "Mission Name";
            };
            class MissionAuthor {
                displayName = CSTRING(MissionAuthor);
                description = CSTRING(MissionAuthor_Desc);
                typeName = "STRING";
                defaultValue = "Mission Author";
            };
            class MissionCustomText {
                displayName = CSTRING(MissionCustomText);
                description = CSTRING(MissionCustomText_Desc);
                typeName = "STRING";
                defaultValue = "";
            };
            class Timer {
                displayName = CSTRING(Timer);
                description = CSTRING(Timer_Desc);
                typeName = "STRING";
                defaultValue = 60;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };
};
