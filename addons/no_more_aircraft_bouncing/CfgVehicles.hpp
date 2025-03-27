class CfgVehicles {
	class Helicopter;
	class ParachuteBase : Helicopter {
		GVAR(exclude) = 1;
	};

	class Helicopter_Base_F;
	class UAV_01_base_F : Helicopter_Base_F {
		GVAR(exclude) = 1;
	};
	class UAV_06_base_F : Helicopter_Base_F {
		GVAR(exclude) = 1;
	};
};
