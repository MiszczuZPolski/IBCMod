class CfgWeapons {
    class Default {};
    //Rifles
    class RifleCore: Default {};
    class Rifle: RifleCore {};
    class Rifle_Base_F: Rifle {};
    class Rifle_Long_Base_F: Rifle_Base_F {};
    class CSA38_MGBASE: Rifle_Long_Base_F {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };

    //Submachine guns
    class csa38_SMG: Rifle_Base_F {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };

    //Pistols
    class PistolCore: Default {};
    class Pistol: PistolCore {};
    class Pistol_Base_F: Pistol {};
    class csa38_Pistol: Pistol_Base_F {
        opticsZoomMax = 1.25;
        opticsZoomMin = 0.25;
    };

};
