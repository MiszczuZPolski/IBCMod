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
    class CSA38_7_7_100x56R: CSA38_Magazine {
        displayName = CSTRING(7_7_100x56R);
        descriptionShort = CSTRING(7_7_100x56R_DESC);
    };
    class CSA38_7_7_100x56RAP: CSA38_7_7_100x56R {
        displayName = CSTRING(7_7_100x56RAP);
        descriptionShort = CSTRING(7_7_100x56RAP_DESC);
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
    class CSA38_7_7_100x56RBlank: CSA38_7_7_30x56Rblank {
        displayName = CSTRING(7_7_100x56RBlank);
        descriptionShort = CSTRING(7_7_100x56RBlank_DESC);
    };
    class CSA38_7_92_20xMauser: CSA38_7_92_5xMauser {
        displayName = CSTRING(7_92_20xMauser);
        descriptionShort = CSTRING(7_92_20xMauser_DESC);
    };
};
