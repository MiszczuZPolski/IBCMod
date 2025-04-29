class RscPicture;
class RscStructuredText;

class GVAR(introDialog)
{
    idd = 9001;
    movingEnable = 0;

    class controls
    {
        class GVAR(Picture): RscPicture
        {
            idc = 1200;
            text = "";
            x = "0.42575 * safezoneW + safezoneX";
            y = "0.258 * safezoneH + safezoneY";
            w = "0.1485 * safezoneW";
            h = "0.198 * safezoneH";
        };
        class GVAR(rscStructuredText_1): RscStructuredText
        {
            idc = 1100;
            x = "0.3515 * safezoneW + safezoneX";
            y = "0.4725 * safezoneH + safezoneY";
            w = "0.297 * safezoneW";
            h = "0.055 * safezoneH";
            colorBackground[] = {0,0,0,1};
        };
        class GVAR(rscStructuredText_2): RscStructuredText
        {
            idc = 1101;
            x = "0.363875 * safezoneW + safezoneX";
            y = "0.555 * safezoneH + safezoneY";
            w = "0.132 * safezoneW";
            h = "0.0275 * safezoneH";
            colorBackground[] = {0,0,0,1};
        };
        class GVAR(rscStructuredText_3): RscStructuredText
        {
            idc = 1102;
            x = "0.504125 * safezoneW + safezoneX";
            y = "0.555 * safezoneH + safezoneY";
            w = "0.132 * safezoneW";
            h = "0.0275 * safezoneH";
            colorBackground[] = {0,0,0,1};
        };
        class GVAR(rscStructuredText_4): RscStructuredText
        {
            idc = 1103;
            x = "0.363875 * safezoneW + safezoneX";
            y = "0.59625 * safezoneH + safezoneY";
            w = "0.132 * safezoneW";
            h = "0.0275 * safezoneH";
            colorBackground[] = {0,0,0,1};
        };
        class GVAR(rscStructuredText_5): RscStructuredText
        {
            idc = 1104;
            x = "0.504125 * safezoneW + safezoneX";
            y = "0.59625 * safezoneH + safezoneY";
            w = "0.132 * safezoneW";
            h = "0.0275 * safezoneH";
            colorBackground[] = {0,0,0,1};
        };
        class GVAR(rscStructuredText_6): RscStructuredText
        {
            idc = 1105;
            x = "0.363875 * safezoneW + safezoneX";
            y = "0.64025 * safezoneH + safezoneY";
            w = "0.27225 * safezoneW";
            h = "0.0275 * safezoneH";
            colorBackground[] = {0,0,0,1};
        };
    };
};
