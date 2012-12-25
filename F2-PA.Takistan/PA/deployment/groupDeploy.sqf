_unit = _this select 0;
_caller = _this select 1;
_id = _this select 2;
marked = false;
_newdir = getDir(_unit);
_group = group _unit;

if(!(_unit == _caller)) exitWith {};

_unit removeAction _id;

onMapSingleClick "player setPosATL _pos; marked = true; true;";

waitUntil{marked};

onMapSingleClick "";

_newpos = getPosATL _unit;

['groupDeploy',[_group, _newpos,_newdir]] call CBA_fnc_globalEvent;