// PA - Folk Assign Gear Script - ACE Wounds Equipment
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// General Equipment

_unit addWeapon "ACE_Earplugs";
_success = [_unit, 1, 1, 1] call ACE_fnc_PackIFAK;

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;							// expecting name of unit; originally passed by using 'this' in unit init

// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_typeofUnit) do
{

// LOADOUT: MEDIC
	case "m":
	{
		_success = [_unit, "ACE_LargeBandage", 10] call ACE_fnc_PackMagazine;
		_success = [_unit, "ACE_Morphine", 10] call ACE_fnc_PackMagazine;
		_success = [_unit, "ACE_Epinephrine", 10] call ACE_fnc_PackMagazine;
		_success = [_unit, "ACE_Medkit", 4] call ACE_fnc_PackMagazine;
	};
	
// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING
_unit selectweapon primaryweapon _unit;