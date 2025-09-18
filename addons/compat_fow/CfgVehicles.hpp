class CfgVehicles {
    class LandVehicle;
    class Tank: LandVehicle {
        class NewTurret;
    };
    class Tank_F: Tank {
        class Turrets {
            class MainTurret: NewTurret {};
        };
        class ViewOptics {};
    };
    class fow_v_m5a1: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class ViewOptics {
                    initFov = 0.21;
                    minFov = 0.11;
                    maxFov = 0.21;
                };
            };
        };
    };
};
