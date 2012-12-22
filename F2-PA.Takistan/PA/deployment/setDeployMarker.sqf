_unit = _this select 0;
_id = _this select 2;
markerset = false;

if(!(_unit == _caller)) exitWith {

hint "Don't use the deploy action unless you're a group leader, fucker.";

};

onMapSingleClick "['setDeployMarker',[_pos]] call CBA_fnc_globalEvent; markerset = true; true;";
waitUntil{markerset};
onMapSingleClick "";

_unit removeAction _id;