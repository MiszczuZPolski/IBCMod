#include "..\script_component.hpp"
/*
 *    Author: D.Anderson
 *    Description:
 *        Countdown hint for players.
 *    Parametr(s):
 */

params ["_time"];

for "_i" from (_time + 6) to 0 step -1 do
{
    if (_i >9) then
    {
        hintSilent parseText format["Misja uruchamia się!<br />Symulacja gracza:  <t color='#ff0000'>Wyłączona</t><br />T - <t color='#ff0000'>%1</t>", _i];
    }
    else
    {
        hintSilent parseText format["Misja uruchamia się!<br />Symulacja gracza: <t color='#ff0000'>Wyłączona</t><br />T - <t color='#ff0000'>0%1</t>", _i];
    };

    sleep 1;
};
