radiosDeleted = false;

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;							// expecting name of unit; originally passed by using 'this' in unit init

waitUntil{!isNil "acre_sys_radio_currentRadioList"};				// Wait until radio list has been init.
waitUntil{(count acre_sys_radio_currentRadioList) > 0};				// Wait until radio list is 1 or higher.

{_unit removeWeapon _x;} foreach acre_sys_radio_currentRadioList;	// Remove all radios.

{ _isRadio = [_x] call acre_api_fnc_isRadio; 						// Remove ItemRadios that haven't been turned into 343s (just in case).
if(_isRadio) then {_unit removeWeapon _x};
} foreach weapons _unit;	

waitUntil {count acre_sys_radio_currentRadioList < 1};				// Wait until radio list updated.

_this execVM "PA\ACRE\setRadioFrequencies.sqf";

waitUntil{frequenciesSet};											// Wait until the custom frequencies per side are set before handing out radios.				

radiosDeleted = true;											// Allow radio assignation to continue.