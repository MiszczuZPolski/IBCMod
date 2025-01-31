class CfgWeapons {
	class Default {};
    //Rifles
    class RifleCore: Default {};
	class Rifle: RifleCore {};
	class Rifle_Base_F: Rifle {};
	class Rifle_Long_Base_F: Rifle_Base_F {};
	class CSA38_MGBASE: Rifle_Long_Base_F {};
    class CSA38_BRENMKII: CSA38_MGBASE {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };
    class CSA38_BRENMKII2: CSA38_BRENMKII {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };
	class CSA38_BRENMKI: CSA38_BRENMKII {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };
    class CSA38_BRENMKI2: CSA38_BRENMKII {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };
    class CSA38_BRENMKIII: CSA38_BRENMKII {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };
    class CSA38_BRENMKIII2: CSA38_BRENMKIII {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };
    class CSA38_MG30: CSA38_MGBASE {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };
	class CSA38_MG34: CSA38_MGBASE {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };
    class CSA38_zb26: CSA38_MGBASE {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };

    //Static weapons
    class LauncherCore: Default {};
	class Launcher: LauncherCore {};
	class Launcher_Base_F: Launcher {};
	class csa38_m36hlaven: Launcher_Base_F {};
	class csa38_brentripod2: csa38_m36hlaven {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };
};
