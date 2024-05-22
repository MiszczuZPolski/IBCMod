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
            class Timer {
                displayName = CSTRING(Mode);
                description = CSTRING(ModeDesc);
                typeName = "STRING";
                defaultValue = 15;
            };
            class CustomText {
                displayName = CSTRING(Name);
                description = CSTRING(NameDesc);
                typeName = "STRING";
                defaultValue = "Custom Text";
            };
            class Terrain {
                displayName = CSTRING(Name);
                description = CSTRING(NameDesc);
                typeName = "STRING";
                defaultValue = "Stratis";
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };
};
