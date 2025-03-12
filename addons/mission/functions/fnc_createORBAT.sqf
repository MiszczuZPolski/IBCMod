#include "..\script_component.hpp"
/*
 *	Author: D.Anderson
 *	Creates ORBAT in Roster Subject
 *	
 *	Arguments:
 *	0: The Unit <OBJECT>
 *	
 *	Return Value:
 *	String
 *	
 *	Example:
 *	[player] call dAn_fnc_createORBAT
 *	
 * 	Public: No
 */

params[["_unit", ACE_player]];

// **** ORBAT ****
private  _groups = [];
private  _arr = [];

//get number of connceted players
private _str = [
	'<font face="RobotoCondensedBold" color="#cba030">',
	'Gracze: </font>',
	((side _unit) countSide allPlayers), // connceted player to side, don't count Zeuses, I think...
	'/',
	playableSlotsNumber side _unit, // all playable slots, I think...
	'<br/><br/>'
]joinString "";

_arr pushBack _str;
// *****************************

//get unique groups
{
	if (isPlayer _x) then {
		_groups pushBackUnique group _x;
	};
}forEach playableUnits;

// get orbat text
{
	private  _name = groupId _x;
	private  _text = ['<font face="RobotoCondensedBold">', _name, '</font><br/>' ] joinString "";
	_arr pushBack _text;
	// each group member
	{
		if (isPlayer _x) then {
			private  _unitIdentity = [_x] call FUNC(getIdentity);

			_text = [
				'<img title="', _unitIdentity select 0, '" src="', _unitIdentity select 1, '" height="16"/>',
				'<font color="#cba030" face="RobotoCondensed">',_unitIdentity select 2, '</font>',
				'<font color="#757575" face="RobotoCondensed">', _unitIdentity select 3,'</font>',
				'<br/>'
			] joinString "";
			_arr pushBack _text;
		};
	} forEach (units _x);

	 _arr pushBack '<br/>';
}forEach _groups;

private _orbat = _arr joinString "";

// return 
_orbat;