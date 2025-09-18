class CfgAmmo {
    class Default {};
    class BulletCore: Default {};
    class BulletBase: BulletCore {};
    class fow_B_762x63_Ball: BulletBase {
        tracerStartTime = 0.0075;
        tracerScale = 0.6;
        tracerEndTime = 5;
        model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
    };
    class fow_B_762x33_Ball: BulletBase {
        tracerStartTime = 0.0075;
        tracerScale = 0.6;
        tracerEndTime = 5;
        model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
    };
};
