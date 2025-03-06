class CfgVehicles {
	class All {};
	class AllVehicles: All {
		class ViewPilot {};
	};
	class Air: AllVehicles {};
	class Plane: Air {
		class ViewPilot: ViewPilot {};
	};
	class Plane_Base_F: Plane {
	    class ViewPilot: ViewPilot {
            minFov = 0.056889;
        };
    };
    class Helicopter: Air {
		class ViewPilot: ViewPilot {};
	};
	class Helicopter_Base_F: Helicopter {
		class ViewPilot: ViewPilot {
            minFov = 0.056889;
        };
	};
};
