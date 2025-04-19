class CfgVehicles {
    class All {};
    class AllVehicles: All {
        class NewTurret {};
    };
    class Land: AllVehicles {};
    class LandVehicle: Land {};
    class StaticWeapon: LandVehicle {
        class Turrets {
            class MainTurret: NewTurret {};
        };
    };
    class csa38_StaticWeapon: StaticWeapon {};
    class CSA38_StaticMGWeapon: csa38_StaticWeapon {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class CSA38_zb26t: CSA38_StaticMGWeapon {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class ViewOptics {
                    initFov = 0.75;
                    minFov = 0.25;
                    maxFov = 1.25;
                };
            };
        };
    };
    class CSA38_TKVZ24mg: CSA38_zb26t {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class ViewOptics {
                    initFov = 0.75;
                    minFov = 0.25;
                    maxFov = 1.25;
                };
            };
        };
    };
    class CSA38_MG34t: CSA38_zb26t {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class CSA38_MG34t2: CSA38_MG34t {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class ViewOptics {
                    initFov = 0.75;
                    minFov = 0.25;
                    maxFov = 1.25;
                };
            };
        };
    };
    class CSA38_MG34t3: CSA38_MG34t2 {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class CSA38_MG34t4: CSA38_MG34t2 {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class CSA38_brenmkiit: CSA38_MG34t4 {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class ViewOptics {
                    initFov = 0.75;
                    minFov = 0.25;
                    maxFov = 1.25;
                };
            };
        };
    };
};
