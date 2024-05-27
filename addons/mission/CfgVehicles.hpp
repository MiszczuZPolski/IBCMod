class CfgVehicles {
    class ACE_Module;
    class GVAR(Module): ACE_Module {
        author = ECSTRING(main,Author);
        category = "IBC";
        displayName = "Intro";
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1; // Global
        isTriggerActivated = 0;
        isDisposable = 0;
        icon = "\a3\ui_f\data\gui\cfg\hints\icon_text\group_1_ca.paa";
        class Arguments {
            class MissionName {
                displayName = CSTRING(MissionName);
                description = CSTRING(MissionNameDesc);
                typeName = "STRING";
                defaultValue = "Mission Name";
            };
            class MissionAuthor {
                displayName = CSTRING(MissionAuthor);
                description = CSTRING(MissionAuthorDesc);
                typeName = "STRING";
                defaultValue = "Mission Author";
            };
            class Timer {
                displayName = CSTRING(Timer);
                description = CSTRING(TimerDesc);
                typeName = "STRING";
                defaultValue = 15;
            };
            class CustomText {
                displayName = CSTRING(CustomText);
                description = CSTRING(CustomTextDesc);
                typeName = "STRING";
                defaultValue = "Custom Text";
            };
            class Terrain {
                displayName = CSTRING(Terrain);
                description = CSTRING(TerrainDesc);
                typeName = "STRING";
                defaultValue = "Stratis";
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };
};
