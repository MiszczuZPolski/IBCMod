_addExtPAA =
{
	private["_path", "_array", "_len", "_last4"];
	_path = toLower _this;
	_array = toArray(_path);
	_len = count _array;
	_last4 = toString[_array select _len-4, _array select _len-3, _array select _len-2, _array select _len-1];
	if(_last4 == ".paa")then {_this} else {_this + ".paa"};
};

_addToArray =
{
	private["_value", "_array", "_count", "_found", "_x", "_forEachIndex"];
	_value = _this select 0;
	_array = _this select 1;
	_count = _this select 2;
	_found = false;
	{
		if(_x select 0 == _value)exitWith
		{
			_found = true;
			_array set [_forEachIndex, [_value, (_x select 1) + _count]];
		};
	}forEach _array;

	if(!_found)then
	{
		_array set [count _array, [_value, _count]];
	};
};

_text = "";
_addGroupUnitToDiary =
{
	_unit = _this select 0;
	_number = _this select 1;
	_text = _text + "<font color='#ffb400'>" + (str _number) + ". " + (name _unit) + "</font>" + (if(leader _unit == _unit)then{" (Dowódca grupy)"}else{""});
	_text = _text + "<br/>";
	if (primaryWeapon _unit != "") then
	{
		_name = getText(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "displayName");
		_text = _text + "Broń główna - " + _name;
		_text = _text + "<br/>";
	};

	_weaponsPrimary = [primaryWeapon _unit] - [""];
	_weaponsSec = [secondaryWeapon _unit] - [""];
	_weapons = weapons _unit - _weaponsPrimary - _weaponsSec - [""];
	_items = assignedItems _unit - [""] - ["ItemRadioAcreFlagged"];
	_uniform = [uniform _unit, vest _unit, headgear _unit] - [""];
	_back = [backpack _unit] - [""];
	_magazines = (magazines _unit - [""])+(primaryWeaponMagazine _unit - [""])+(handgunMagazine _unit - [""])+(secondaryWeaponMagazine _unit - [""]);
	_teme = (uniformItems _unit - [""])+(vestItems _unit - [""])+(backpackItems _unit - [""]);

	{
		_cfg = configFile >> "CfgWeapons" >> _x;
		_pic = getText(_cfg >> "picture") call _addExtPAA;
		_text = _text + "<img image=""" + _pic + """ height=50 /> ";
	} forEach (_weaponsPrimary)+(primaryWeaponItems _unit - [""]);
	_text = _text + "<br/>";

	if (secondaryWeapon _unit != "") then
	{
		_nama = getText(configFile >> "CfgWeapons" >> (secondaryWeapon _unit) >> "displayName");
		_text = _text + "Wyrzutnia - " + _nama;
		_text = _text + "<br/>";
	};

	{
		_cfg = configFile >> "CfgWeapons" >> _x;
		_pic = getText(_cfg >> "picture") call _addExtPAA;
		_text = _text + "<img image=""" + _pic + """ height=50 /> ";
	} forEach (_weaponsSec)+(secondaryWeaponItems _unit - [""]);
	_text = _text + "<br/>";

	_weaponsList = [];
	_magasinesList = [];
	_uniformList = [];

	{
	_cfg = configFile >> "CfgWeapons" >> _x;
	_pic = getText(_cfg >> "picture") call _addExtPAA;
	if (!(_x in items _unit)) then
	{
		[_pic, _weaponsList, 1] call _addToArray;
	};
	} forEach (_weapons)+(handgunItems _unit - [""]);

	{
		_cfg = configFile >> "CfgWeapons" >> _x;
		_pic = getText(_cfg >> "picture") call _addExtPAA;
		[_pic, _weaponsList, 1] call _addToArray;
	} forEach (_items - _weapons - [""]);

	{
		_cfg = configFile >> "CfgMagazines" >> _x;
		_pic = getText(_cfg >> "picture") call _addExtPAA;
		[_pic, _magasinesList, 1] call _addToArray;
	} forEach (_magazines);

	{
		_cfg = configFile >> "CfgWeapons" >> _x;
		_pic = getText(_cfg >> "picture") call _addExtPAA;
		[_pic, _magasinesList, 1] call _addToArray;
	} forEach (_teme - _magazines - [""]);

	{
		_cfg = configFile >> "CfgWeapons" >> _x;
		_pic = getText(_cfg >> "picture") call _addExtPAA;
		[_pic, _uniformList, 1] call _addToArray;
	} forEach (_uniform);

	{
		_cfg = configFile >> "CfgVehicles" >> _x;
		_pic = getText(_cfg >> "picture") call _addExtPAA;
		[_pic, _uniformList, 1] call _addToArray;
	} forEach (_back);

	{
		_pic = _x select 0;
		_count = _x select 1;
		for "_i" from 1 to _count do
		{
			_text = _text + "<img image=""" + _pic + """ height=32 /> ";
		};
	}forEach _weaponsList;
	_text = _text + "<br/>";

	{
		_pic = _x select 0;
		_count = _x select 1;
		_count = str _count;
		_text = _text + "<img image=""" + _pic + """ height=24 />" + "x" + _count + "  ";
	} forEach _magasinesList;
	_text = _text + "<br/>";
	_text = _text + "<br/>";

	{
		_pic = _x select 0;
		_count = _x select 1;
		for "_i" from 1 to _count do
		{
			_text = _text + "<img image=""" + _pic + """ height=50 /> ";
		};
	} forEach _uniformList;
	_text = _text + "<br/>";
	_text = _text + "<br/>";
};

/*
{[_x, _forEachIndex + 1] call _addGroupUnitToDiary;} forEach units group ACE_player;
_name = toArray(str (group ACE_player));
_shorten = [];
for "_i" from 2 to ((count _name) - 1) do
{
	_shorten set [_i - 2, _name select _i];
};
_name = toString(_shorten);
ACE_player createDiarySubject ["squad", "Skład drużyn"];
ACE_player createDiaryRecord ["squad",["Skład sekcji (" + _name + ")", _text]];
*/

_addUnitToDiary =
{
	_unit = _this select 0;
	_number = _this select 1;
	_ACE_playerRole = roleDescription _unit;
	_text = _text + "<font color='#ffb400'>" + (str _number) + ". " + (name _unit) + "</font>" + (if(leader _unit == _unit)then{" (Dowódca grupy)"}else{""});
	_text = _text + "<br/><font color='#ff0000'>Pełniona funkcja - " + _ACE_playerRole + "</font>";
	_text = _text + "<br/>" + "<font color='#db0000'>" + "Spis broni:" + "</font>";
	_text = _text + "<br/>";
	if (primaryWeapon _unit != "") then
	{
		_name = getText(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "displayName");
		_text = _text + "Broń główna - " + _name;
		_text = _text + "<br/>";
		_text = _text + "Akcesoria - ";
		{
			_nama = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_text = _text + _nama + ", ";
		} forEach (primaryWeaponItems _unit - [""]);
		_text = _text + "<br/><br/>";
	}
	else
	{
		_text = _text + "Broń główna - brak" +  "<br/><br/>";
	};


	if (handgunWeapon _unit != "") then
	{
		_name = getText(configFile >> "CfgWeapons" >> (handgunWeapon _unit) >> "displayName");
		_text = _text + "Broń przyboczna - " + _name;
		_text = _text + "<br/>";
		_text = _text + "Akcesoria - ";
		{
			_nama = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_text = _text + _nama + ", ";
		} forEach (handgunItems _unit - [""]);
		_text = _text + "<br/><br/>";
	}
	else
	{
		_text = _text + "Broń przyboczna - brak" + "<br/><br/>";
	};


	if (secondaryWeapon _unit != "") then
	{
		_nama = getText(configFile >> "CfgWeapons" >> (secondaryWeapon _unit) >> "displayName");
		_text = _text + "Broń dodatkowa - " + _nama;
		_text = _text + "<br/>";
		_text = _text + "Akcesoria - ";
		{
			_nama = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_text = _text + _nama + ", ";
		} forEach (secondaryWeaponItems _unit - [""]);
	}
	else
	{
		_text = _text + "Broń dodatkowa - brak" + "<br/><br/>";
	};

	_weaponsPrimary = [primaryWeapon _unit] - [""];
	_weaponsSec = [secondaryWeapon _unit] - [""];
	_weapons = weapons _unit - _weaponsPrimary - _weaponsSec - [""];
	_items = assignedItems _unit - [""] - ["ItemRadioAcreFlagged"];
	_uniform = [uniform _unit, vest _unit, headgear _unit] - [""];
	_back = [backpack _unit] - [""];
	_magazines = (magazines _unit - [""])+(primaryWeaponMagazine _unit - [""])+(handgunMagazine _unit - [""])+(secondaryWeaponMagazine _unit - [""]);
	_teme = (uniformItems _unit - [""])+(vestItems _unit - [""])+(backpackItems _unit - [""]);

	_weaponsList = [];
	_magasinesList = [];
	_uniformList = [];

	{
		_pic = getText(configFile >> "CfgMagazines" >> _x >> "displayName");
		//_pic = getText(_cfg >> "picture") call _addExtPAA;
		[_pic, _magasinesList, 1] call _addToArray;
	} forEach (_magazines);

	{
		_pic = getText(configFile >> "CfgWeapons" >> _x >> "displayName");;
		//_pic = getText(_cfg >> "picture") call _addExtPAA;
		[_pic, _magasinesList, 1] call _addToArray;
	} forEach (_teme - _magazines - [""]);

	{
		_pic = getText(configFile >> "CfgWeapons" >> _x >> "displayName");;
		//_pic = getText(_cfg >> "picture") call _addExtPAA;
		[_pic, _uniformList, 1] call _addToArray;
	} forEach (_uniform);

	{
		_pic = getText(configFile >> "CfgVehicles" >> _x >> "displayName");;
		//_pic = getText(_cfg >> "picture") call _addExtPAA;
		[_pic, _uniformList, 1] call _addToArray;
	} forEach (_back);

	_text = _text + "<font color='#33ccff'>" + "Spis przedmiotów:" + "</font>" + "<br/>";
	{
		_pic = _x select 0;
		_count = _x select 1;
		_count = str _count;
		_text = _text + _pic + " <font color='#00FF00'>x" + _count + "</font><br/>";
	} forEach _magasinesList;
	_text = _text + "<br/>";
	_text = _text + "<font color='#00d636'>" + "Umundurowanie:" + "</font>" + "<br/>";
	{
		_pic = _x select 0;
		_count = _x select 1;
		_count = str _count;
		_text = _text + _pic + "<br/>";
	} forEach _uniformList;
	_text = _text + "<br/>";
	_weight = parseNumber ([_unit] call ace_common_fnc_getWeight); //[ACE_player] call ace_common_fnc_getWeight
	_text = _text + "<font color='#ffe838'>" + "Łączna waga wyposażenia: " + str _weight + "kg" + "</font>";

	ACE_player createDiaryRecord ["squad",["Uzbrojenie " + (name _unit), _text]];
	_text = "";
};

if !(ACE_player diarySubjectExists "squad") then {
	ACE_player createDiarySubject ["squad", "Wyposażenie"];
};

_text = "";
{[_x, _forEachIndex + 1] call _addUnitToDiary;} forEach units group ACE_player;

_text = "";
{[_x, _forEachIndex + 1] call _addGroupUnitToDiary;} forEach units group ACE_player;
_name = toArray(str (group ACE_player));
_shorten = [];
for "_i" from 2 to ((count _name) - 1) do
{
	_shorten set [_i - 2, _name select _i];
};
_name = toString(_shorten);

ACE_player createDiaryRecord ["squad",["Skład sekcji (" + _name + ")", _text]];
