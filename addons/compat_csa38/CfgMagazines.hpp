class CfgMagazines {
	class Default {};
    class CA_Magazine: Default {};
    class CSA38_PistolMagazine: CA_Magazine {};
	class CSA38_Magazine: Default {};
	class csa38_32_45ACP: CSA38_Magazine {
        displayName = CSTRING(32_45ACP);
        descriptionShort = CSTRING(32_45ACP_DESC);
    };
    class csa38_32_9x19: CSA38_Magazine {
        displayName = CSTRING(32_9x19);
        descriptionShort = CSTRING(32_9x19_DESC);
    };
    class csa38_32_9x19Blank: csa38_32_9x19 {
        displayName = CSTRING(32_9x19Blank);
        descriptionShort = CSTRING(32_9x19Blank_DESC);
    };
    class csa38_33_9x19: csa38_32_9x19 {
        displayName = CSTRING(33_9x19);
        descriptionShort = CSTRING(33_9x19_DESC);
    };
    class CSA38_5_13_9x99mmB: CSA38_Magazine {
        displayName = CSTRING(5_13_9x99mmB);
        descriptionShort = CSTRING(5_13_9x99mmB_DESC);
    };
    class CSA38_5x7_62_54R: CSA38_Magazine {
        displayName = CSTRING(5x7_62_54R);
        descriptionShort = CSTRING(5x7_62_54R_DESC);
    };
    class CSA38_9mm_8xBrowning: CSA38_PistolMagazine {};
    class CSA38_6_35mm_8xBrowning: CSA38_9mm_8xBrowning {
        displayName = CSTRING(6_35mm_8xBrowning);
        descriptionShort = CSTRING(6_35mm_8xBrowning_DESC);
    };
    class 11Rnd_45ACP_Mag: CA_Magazine {};
    class 6Rnd_45ACP_Cylinder: 11Rnd_45ACP_Mag {};
    class CSA38_6Rnd_38SW_Cylinder: 6Rnd_45ACP_Cylinder {
        displayName = CSTRING(6Rnd_38SW_Cylinder);
        descriptionShort = CSTRING(6Rnd_38SW_Cylinder_DESC);
    };
    class CSA38_7_92_5xMauser: CSA38_Magazine {};
    class CSA38_7_5_5xMAS: CSA38_7_92_5xMauser {
        displayName = CSTRING(7_5_5xMAS);
        descriptionShort = CSTRING(7_5_5xMAS_DESC);
    };
    class csa38_7_63mm_10xMauser: CSA38_PistolMagazine {
        displayName = CSTRING(7_63mm_10xMauser);
        descriptionShort = CSTRING(7_63mm_10xMauser_DESC);
    };
    class csa38_7_65mm_7xBrow: CSA38_PistolMagazine {
        displayName = CSTRING(7_65mm_7xBrowning);
        descriptionShort = CSTRING(7_65mm_7xBrowning_DESC);
    };
    class csa38_7_65mm_8xBrow: CSA38_PistolMagazine {
        displayName = CSTRING(7_65mm_8xBrowning);
        descriptionShort = CSTRING(7_65mm_8xBrowning_DESC);
    };
    class CSA38_7_65mm_8xBrowning: CSA38_9mm_8xBrowning {
        displayName = CSTRING(7_65mm_8xBrowning);
        descriptionShort = CSTRING(7_65mm_8xBrowning_DESC);
    };
    class CSA38_7_65mm_8xBrowningSD: CSA38_9mm_8xBrowning {
        displayName = CSTRING(7_65mm_8xBrowningSD);
        descriptionShort = CSTRING(7_65mm_8xBrowningSD_DESC);
    };
    class CSA38_7_7_10x56R: CSA38_Magazine {
        displayName = CSTRING(7_7_10x56R);
        descriptionShort = CSTRING(7_7_10x56R_DESC);
    };
    class CSA38_7_7_10x56RAP: CSA38_7_7_10x56R {
        displayName = CSTRING(7_7_10x56RAP);
        descriptionShort = CSTRING(7_7_10x56RAP_DESC);
    };
    class CSA38_7_7_10x56Rblank: CSA38_7_7_10x56R {
        displayName = CSTRING(7_7_10x56Rblank);
        descriptionShort = CSTRING(7_7_10x56Rblank_DESC);
    };
    class CSA38_7_7_30x56R: CSA38_Magazine {
        displayName = CSTRING(7_7_30x56R);
        descriptionShort = CSTRING(7_7_30x56R_DESC);
    };
    class CSA38_7_7_30x56RAP: CSA38_7_7_30x56R {
        displayName = CSTRING(7_7_30x56RAP);
        descriptionShort = CSTRING(7_7_30x56RAP_DESC);
    };
    class CSA38_7_7_30x56Rblank: CSA38_7_7_30x56R {
        displayName = CSTRING(7_7_30x56Rblank);
        descriptionShort = CSTRING(7_7_30x56Rblank_DESC);
    };
    class CSA38_7_7_100x56R: CSA38_7_7_30x56R {
        displayName = CSTRING(7_7_100x56R);
        descriptionShort = CSTRING(7_7_100x56R_DESC);
    };
    class CSA38_7_7_100x56RAP: CSA38_7_7_100x56R {
        displayName = CSTRING(7_7_100x56RAP);
        descriptionShort = CSTRING(7_7_100x56RAP_DESC);
    };
    class CSA38_7_7_100x56RBlank: CSA38_7_7_30x56Rblank {
        displayName = CSTRING(7_7_100x56RBlank);
        descriptionShort = CSTRING(7_7_100x56RBlank_DESC);
    };
    class CSA38_7_92_20xMauser: CSA38_7_92_5xMauser {
        displayName = CSTRING(7_92_20xMauser);
        descriptionShort = CSTRING(7_92_20xMauser_DESC);
    };
    class csa38_7_92_20xMauser2: CSA38_7_92_20xMauser {
        displayName = CSTRING(7_92_20xMauser2);
        descriptionShort = CSTRING(7_92_20xMauser2_DESC);
    };

    class csa38_7_92_20xMauser2GE: csa38_7_92_20xMauser2 {
        displayName = CSTRING(7_92_20xMauser2GE);
        descriptionShort = CSTRING(7_92_20xMauser2GE_DESC);
    };

    class CSA38_7_92_20xMauserCZ: CSA38_7_92_5xMauser {
        displayName = CSTRING(7_92_20xMauserCZ);
        descriptionShort = CSTRING(7_92_20xMauserCZ_DESC);
    };
    class CSA38_7_92_5xMauser2: CSA38_7_92_5xMauser {
        displayName = CSTRING(7_92_5xMauser2);
        descriptionShort = CSTRING(7_92_5xMauser2_DESC);
    };
    class CSA38_7_92_20xMauserCZ2: CSA38_7_92_5xMauser2 {
        displayName = CSTRING(7_92_20xMauserCZ2);
        descriptionShort = CSTRING(7_92_20xMauserCZ2_DESC);
    };
    class CSA38_7_92_20xMauserGE: CSA38_7_92_20xMauser {
        displayName = CSTRING(7_92_20xMauserGE);
        descriptionShort = CSTRING(7_92_20xMauserGE_DESC);
    };
    class csa38_7_92_50xMauserMG: CSA38_Magazine {
        displayName = CSTRING(7_92_50xMauserMG);
        descriptionShort = CSTRING(7_92_50xMauserMG_DESC);
    };
    class csa38_7_92_50xMauserMGAP: csa38_7_92_50xMauserMG {
        displayName = CSTRING(7_92_50xMauserMGAP);
        descriptionShort = CSTRING(7_92_50xMauserMGAP_DESC);
    };
    class csa38_7_92_250xMauserMG: csa38_7_92_50xMauserMG {
        displayName = CSTRING(7_92_250xMauserMG);
        descriptionShort = CSTRING(7_92_250xMauserMG_DESC);
    };
    class csa38_7_92_250xMauserMGAP: csa38_7_92_250xMauserMG {
        displayName = CSTRING(7_92_250xMauserMGAP);
        descriptionShort = CSTRING(7_92_250xMauserMGAP_DESC);
    };
    class csa38_7_92_25xMauserMG: CSA38_Magazine {
        displayName = CSTRING(7_92_25xMauserMG);
        descriptionShort = CSTRING(7_92_25xMauserMG_DESC);
    };
    class csa38_7_92_25xMauserMGAP: csa38_7_92_25xMauserMG {
        displayName = CSTRING(7_92_25xMauserMGAP);
        descriptionShort = CSTRING(7_92_25xMauserMGAP_DESC);
    };
    class CSA38_7_92_30xMauser: CSA38_7_92_20xMauser {
        displayName = CSTRING(7_92_30xMauser);
        descriptionShort = CSTRING(7_92_30xMauser_DESC);
    };
    class CSA38_7_92_30xMauser2: csa38_7_92_20xMauser2 {
        displayName = CSTRING(7_92_30xMauser2);
        descriptionShort = CSTRING(7_92_30xMauser2_DESC);
    };
    class csa38_7_92_30xMauser2GE: CSA38_7_92_30xMauser2 {
        displayName = CSTRING(7_92_30xMauser2GE);
        descriptionShort = CSTRING(7_92_30xMauser2GE_DESC);
    };
    class CSA38_7_92_30xMauserGE: CSA38_7_92_30xMauser {
        displayName = CSTRING(7_92_30xMauserGE);
        descriptionShort = CSTRING(7_92_30xMauserGE_DESC);
    };
    class CSA38_7_92_47xMauser: CSA38_7_92_20xMauser {
        displayName = CSTRING(7_92_47xMauser);
        descriptionShort = CSTRING(7_92_47xMauser_DESC);
    };
    class CSA38_7_92_47xMauserGE: CSA38_7_92_47xMauser {
        displayName = CSTRING(7_92_47xMauserGE);
        descriptionShort = CSTRING(7_92_47xMauserGE_DESC);
    };
    class CSA38_7_92_5xMauser3: CSA38_7_92_5xMauser {
        displayName = CSTRING(7_92_5xMauser3);
        descriptionShort = CSTRING(7_92_5xMauser3_DESC);
    };
    class csa38_7_92_5xMauserKAR: CSA38_7_92_5xMauser {
        displayName = CSTRING(7_92_5xMauserKAR);
        descriptionShort = CSTRING(7_92_5xMauserKAR_DESC);
    };
    class csa38_7_92_20xMauserKAR: csa38_7_92_5xMauserKAR {
        displayName = CSTRING(7_92_20xMauserKAR);
        descriptionShort = CSTRING(7_92_20xMauserKAR_DESC);
    };
    class csa38_7_92_20xMauserKAR2: csa38_7_92_5xMauserKAR {
        displayName = CSTRING(7_92_20xMauserKAR2);
        descriptionShort = CSTRING(7_92_20xMauserKAR2_DESC);
    };
    class csa38_7_92_5xMauserKAR2: CSA38_7_92_5xMauser {
        displayName = CSTRING(7_92_5xMauserKAR2);
        descriptionShort = CSTRING(7_92_5xMauserKAR2_DESC);
    };
    class csa38_8_00_30xMauserMG: CSA38_Magazine {
        displayName = CSTRING(8_00_30xMauserMG);
        descriptionShort = CSTRING(8_00_30xMauserMG_DESC);
    };
    class csa38_8_00_5xMannlicher: CSA38_Magazine {
        displayName = CSTRING(8_00_5xMannlicher);
        descriptionShort = CSTRING(8_00_5xMannlicher_DESC);
    };
    class csa38_8x56_25xMannlicherMG: CSA38_Magazine {
        displayName = CSTRING(8x56_25xMannlicherMG);
        descriptionShort = CSTRING(8x56_25xMannlicherMG_DESC);
    };
    class csa38_9_MM_32xMP28: CSA38_Magazine {
        displayName = CSTRING(9_MM_32xMP28);
        descriptionShort = CSTRING(9_MM_32xMP28_DESC);
    };
    class csa38_9_MM_20xMP28: csa38_9_MM_32xMP28 {
        displayName = CSTRING(9_MM_20xMP28);
        descriptionShort = CSTRING(9_MM_20xMP28_DESC);
    };
    class csa38_9_MM_32xMP18: CSA38_Magazine {
        displayName = CSTRING(9_MM_32xMP18);
        descriptionShort = CSTRING(9_MM_32xMP18_DESC);
    };
    class csa38_9_MM_32xMP35: CSA38_Magazine {
        displayName = CSTRING(9_MM_32xMP35);
        descriptionShort = CSTRING(9_MM_32xMP35_DESC);
    };
    class csa38_9_MM_32xPARA: CSA38_Magazine {
        displayName = CSTRING(9_MM_32xPARA);
        descriptionShort = CSTRING(9_MM_32xPARA_DESC);
    };
    class CSA38_9_mm_36xBrowning: CSA38_Magazine {
        displayName = CSTRING(9_mm_36xBrowning);
        descriptionShort = CSTRING(9_mm_36xBrowning_DESC);
    };
    class CSA38_9_mm_96xBrowning: CSA38_9_mm_36xBrowning {
        displayName = CSTRING(9_mm_96xBrowning);
        descriptionShort = CSTRING(9_mm_96xBrowning_DESC);
    };
    class csa38_9mm_8xLuger: CSA38_PistolMagazine {
        displayName = CSTRING(9mm_8xLuger);
        descriptionShort = CSTRING(9mm_8xLuger_DESC);
    };
    class csa38_9mm_8xPARA: CSA38_PistolMagazine {
        displayName = CSTRING(9mm_8xPARA);
        descriptionShort = CSTRING(9mm_8xPARA_DESC);
    };
    class CSA38_9mm_9xBrowning: CSA38_PistolMagazine {
        displayName = CSTRING(9mm_9xBrowning);
        descriptionShort = CSTRING(9mm_9xBrowning_DESC);
    };
    class csa38_brenbedna: Default {
        displayName = CSTRING(brenbedna);
    };
    class csa38_brenbedna2: Default {
        displayName = CSTRING(brenbedna2);
    };
    class csa38_FlareWhite26mm: CSA38_Magazine {
        displayName = CSTRING(FlareWhite26mm);
        descriptionShort = CSTRING(FlareWhite26mm_DESC);
    };
    class csa38_FlareGreen26mm: csa38_FlareWhite26mm {
        displayName = CSTRING(FlareGreen26mm);
        descriptionShort = CSTRING(FlareGreen26mm_DESC);
    };
    class csa38_FlareRed26mm: csa38_FlareWhite26mm {
        displayName = CSTRING(FlareRed26mm);
        descriptionShort = CSTRING(FlareRed26mm_DESC);
    };
    class csa38_FlareYellow26mm: csa38_FlareWhite26mm {
        displayName = CSTRING(FlareYellow26mm);
        descriptionShort = CSTRING(FlareYellow26mm_DESC);
    };
    class csa38_lk26bedna: Default {
        displayName = CSTRING(lk26bedna);
    };
    class csa38_lk26bedna2: Default {
        displayName = CSTRING(lk26bedna2);
    };
    class csa38_mas38mag: CSA38_Magazine {
        displayName = CSTRING(mas38mag);
        descriptionShort = CSTRING(mas38mag_DESC);
    };
};
