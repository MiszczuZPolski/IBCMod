class CfgMagazines {
    class Default {};
    class CA_Magazine: Default {};

    class fow_20Rnd_762x63: CA_Magazine {};
    class GVAR(20Rnd_762x63_T): fow_20Rnd_762x63 {
        displayName = CSTRING(mag_20rnd_762x63_t_name);
        descriptionShort = CSTRING(mag_20rnd_762x63_t_desc);
        tracersEvery = 1;
    };

    class fow_8Rnd_762x63: CA_Magazine {};
    class GVAR(8Rnd_762x63_T): fow_8Rnd_762x63 {
        displayName = CSTRING(mag_8rnd_762x63_t_name);
        descriptionShort = CSTRING(mag_8rnd_762x63_t_desc);
        tracersEvery = 1;
    };

    class fow_15Rnd_762x33: CA_Magazine {};
    class GVAR(15Rnd_762x33_T): fow_15Rnd_762x33 {
        displayName = CSTRING(mag_15rnd_762x33_t_name);
        descriptionShort = CSTRING(mag_15rnd_762x33_t_desc);
        tracersEvery = 1;
    };

    class fow_5Rnd_762x63: CA_Magazine {};
    class GVAR(5Rnd_762x63_T): fow_5Rnd_762x63 {
        displayName = CSTRING(mag_5rnd_762x63_t_name);
        descriptionShort = CSTRING(mag_5rnd_762x63_t_desc);
        tracersEvery = 1;
    };

    class fow_30Rnd_762x63: CA_Magazine {};
    class GVAR(30Rnd_762x63_T): fow_30Rnd_762x63 {
        displayName = CSTRING(mag_30rnd_762x63_t_name);
        descriptionShort = CSTRING(mag_30rnd_762x63_t_desc);
        tracersEvery = 1;
    };

    class fow_50Rnd_762x63: fow_30Rnd_762x63 {};
    class GVAR(50Rnd_762x63_T): fow_50Rnd_762x63 {
        displayName = CSTRING(mag_50rnd_762x63_t_name);
        descriptionShort = CSTRING(mag_50rnd_762x63_t_desc);
        tracersEvery = 1;
    };

    class fow_100Rnd_762x63: fow_30Rnd_762x63 {};
    class GVAR(100Rnd_762x63_T): fow_100Rnd_762x63 {
        displayName = CSTRING(mag_100rnd_762x63_t_name);
        descriptionShort = CSTRING(mag_100rnd_762x63_t_desc);
        tracersEvery = 1;
    };
    class GVAR(200Rnd_762x63): fow_100Rnd_762x63 {
        mass = 70;
        count = 200;
        displayName = CSTRING(mag_200rnd_762x63_name);
        descriptionShort = CSTRING(mag_200rnd_762x63_desc);
    };
    class GVAR(200Rnd_762x63_T): GVAR(200Rnd_762x63) {
        displayName = CSTRING(mag_200rnd_762x63_t_name);
        descriptionShort = CSTRING(mag_200rnd_762x63_t_desc);
        tracersEvery = 1;
    };

    class fow_7Rnd_45acp: CA_Magazine {};
    class GVAR(7Rnd_45acp_T): fow_7Rnd_45acp {
        displayName = CSTRING(mag_7rnd_45acp_t_name);
        descriptionShort = CSTRING(mag_7rnd_45acp_t_desc);
        tracersEvery = 1;
    };
};
