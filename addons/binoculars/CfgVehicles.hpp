// class CfgVehicles
// {
// 	class Plane
// 	{
// 		class ViewPilot;
// 	};
// 	class Plane_Base_F: Plane
// 	{
// 		class ViewPilot: ViewPilot
// 		{
// 			minFov = 0.09375;
// 		};
// 	};
// };

class CfgVehicles {
	class All {};
	class AllVehicles: All {
		class ViewPilot {};
        class NewTurret {};
	};
	class Air: AllVehicles {};
	class Plane: Air {
		class ViewPilot: ViewPilot {};
	};
	class Plane_Base_F: Plane {
	    class ViewPilot: ViewPilot {
            minFov = 0.056889;
        };
        class Turrets {
			class CopilotTurret: NewTurret {
				class ViewGunner: ViewPilot {
                    //wypierdala błąd w RPT
                    minFov = 0.056889;
                };
			};
		};
    };
};
