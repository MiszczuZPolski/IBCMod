class CfgVehicles {
    class All {};
    class AllVehicles: All {
        class ViewPilot {};
    };
    class Air: AllVehicles {};
    class Plane: Air {
        class ViewPilot: ViewPilot {
            minFov = 0.09375;
        };
    };
    class Helicopter: Air {
        class ViewPilot: ViewPilot {
            minFov = 0.09375;
        };
    };
};
