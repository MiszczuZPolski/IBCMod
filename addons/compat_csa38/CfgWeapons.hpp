class CfgWeapons {
    class Default {};
	class RifleCore: Default {};
    class Rifle: RifleCore {};
	class Rifle_Base_F: Rifle {};
	class CSA38_vz24: Rifle_Base_F {};
	class CSA38_kar98k: CSA38_vz24 {
        displayName = CSTRING(kar98k);
    };

};
