class CfgAmmo {
    class SmokeShell;
    class SmokeShellGreen;
    class SmokeShellRed;
    class SmokeShellYellow;

    // RHS american smoke grenades
    class rhs_40mm_m715_green: SmokeShellGreen {
        simulation = "shotSmoke";
        deflectionSlowDown = 0;
    };

    class rhs_40mm_m713_red: SmokeShellRed {
        simulation = "shotSmoke";
        deflectionSlowDown = 0;
    };

    class rhs_40mm_m714_white: SmokeShell {
        simulation = "shotSmoke";
        deflectionSlowDown = 0;
    };

    class rhs_40mm_m716_yellow: SmokeShellYellow {
        simulation = "shotSmoke";
        deflectionSlowDown = 0;
    };
};
