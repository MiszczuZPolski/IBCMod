class CfgWeapons {
    class Default {};
    class RifleCore: Default {};
    class Rifle: RifleCore {};
    class Rifle_Base_F: Rifle {};
    class fow_rifle_base: Rifle_Base_F {};
    class fow_w_m1918a2: fow_rifle_base {
        magazines[] += {QGVAR(20Rnd_762x63_T)};
    };
    class fow_w_m1_garand: fow_rifle_base {
        magazines[] += {QGVAR(8Rnd_762x63_T)};
    };
    class fow_w_m1_carbine : fow_rifle_base {
        magazines[] += {QGVAR(15Rnd_762x33_T)};
    };
    class fow_w_m1919 : fow_rifle_base {
        magazines[] += {QGVAR(30Rnd_762x63_T), QGVAR(50Rnd_762x63_T), QGVAR(100Rnd_762x63_T), QGVAR(200Rnd_762x63), QGVAR(200Rnd_762x63_T)};
    };

    class fow_rifleBolt_base: fow_rifle_base {};
    class fow_w_m1903A1: fow_rifleBolt_base {
        magazines[] += {QGVAR(5Rnd_762x63_T)};
    };

    class PistolCore: Default {};
    class Pistol: PistolCore {};
    class Pistol_Base_F: Pistol {};
    class fow_w_m1911: Pistol_Base_F {
        magazines[] += {QGVAR(7Rnd_45acp_T)};
    };

};
