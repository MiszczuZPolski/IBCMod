class EMM_mainMenu_CfgMenus {
    class VN {
        class menus {
            class MainMenu {};
            class MultiplayerVN: MainMenu {
                items[] = {"IBC", "ServerBrowser", "SOGPrairieFire", "MikeForce", "Exit"};

                class ServerBrowser {};
                class IBC: ServerBrowser {
                    action = QUOTE(call (uiNamespace getVariable QQFUNC(join)));
                    text = CSTRING(SpotlightHeader);
                };
            };
        };
    };
};
