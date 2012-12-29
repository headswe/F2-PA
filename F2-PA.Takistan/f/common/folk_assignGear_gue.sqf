// F2 - Folk Assign Gear Script - NAPA (A2GUE) Equipment
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DEFINE EQUIPMENT TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//		co		- commander
//		dc 		- deputy commander
//		m 		- medic
//		ftl		- fire team leader
//		ar 		- automatic rifleman
//		aar		- assistant automatic rifleman
//		rat		- rifleman (AT)
//		samg	- surface to air missile gunner
//		samag	- surface to air missile assistant
//		mmgg	- medium mg gunner
//		mmgag	- medium mg assistant
//		hmgg	- heavy mg gunner (deployable)
//		hmgag	- heavy mg assistant (deployable)
//		matg	- medium AT gunner
//		matag	- medium AT assistant
//		hatg	- heavy AT gunner
//		hatg	- heavy AT assistant
//		mtrg	- mortar gunner (deployable)
//		mtrag	- mortar assistant (deployable)
//		sn		- sniper
//		sp		- spotter
//		c		- ground vehicle crew
//		p		- air vehicle pilots
//		eng		- engineers
//
//		r 		- rifleman
//		car		- carabineer
//		smg		- submachinegunner
//		gren	- grenadier
//
//		v_car	- car/4x4
//		v_tr	- truck
//		v_ifv	- ifv
//
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

_rifle = "ACE_AKM"; _riflemag = "ACE_30Rnd_762x39_S_AK47";																						// Standard Riflemen (Spotter, HMG Assistant Gunner, MMG Assistant Gunner, Assistant Automatic Rifleman, MAT Assistant Gunner, HAT Assistant Gunner, MTR Assistant Gunner, Rifleman)

_carbine = "ACE_AKS74P"; _carbinemag = "ACE_30Rnd_545x39_S_AK"; 																						// Standard Carabineer (Medic, HMG Gunner, Rifleman (AT), Rifleman (AA), MAT Gunner, HAT Gunner, MTR Gunner, Carabineer)

_smg = "bizon"; _smgmag = "64Rnd_9x19_Bizon";																								// Standard Submachine Gun/Personal Defence Weapon (Vehicle Crew, Aircraft Pilot, Submachinegunner)

_glrifle = "ACE_AKS74_GP25"; _glriflemag = "ACE_30Rnd_545x39_S_AK"; _glmag = "1Rnd_HE_GP25";															// Rifle with GL and HE grenades (CO, DC, FTLs)
_glsmokewhite = "1Rnd_Smoke_GP25"; _glsmokegreen = "1Rnd_SmokeGreen_GP25"; _glsmokered = "1Rnd_SmokeRed_GP25";    							// Smoke for FTLs, Squad Leaders, etc 
_glflarewhite = "FlareWhite_GP25"; _glflarered = "FlareRed_GP25"; _glflareyellow = "FlareYellow_GP25"; _glflaregreen = "FlareGreen_GP25";	// Flares for FTLs, Squad Leaders, etc

_pistol = "ACE_APS"; _pistolmag = "ACE_20Rnd_9x18_APS";																						// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)

_grenade = "HandGrenade_East"; _smokegrenade = "SmokeShell";_smokegrenadegreen = "SmokeShellGreen";																				// Grenades

_bagmedium = "ACE_ALICE_Backpack";		// 8+ slots																							// Backpack for assistant gunners (AAR, AMMG, AMAT, AHAT), so that they don't have to drop ammo themselves

// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

_AR = "ACE_RPK74M"; _ARmag = "ACE_75Rnd_545x39_T_RPK";																								// Automatic Rifleman

_MMG = "PK"; _MMGmag = "100Rnd_762x54_PK";																										// Medium MG

_HMG = "ACE_DSHKMProxy";																									// Heavy MG (note: HMG is an assembled weapon, gunner carries weapon)
_HMGmount = "ACE_DSHKMProxy";																													// Assistant Heavy MG (note: HMG is an assembled weapon, assistant carries bipod/tripd)
_HMGammo = "ACE_DSHKM_CSWDM";

_RAT = "RPG7V"; _RATmag = "PG7V";																											// Rifleman AT

_MAT = "ACE_RPG7V_PGO7"; _MATmag1 = "PG7V"; _MATmag2 = "PG7VR";																						// Medium AT

_HAT = "MetisLauncher"; _HATmag1 = "AT13"; _HATmag2 = "AT13";																				// Heavy AT Gunner

_MTR = "ACE_M252Proxy";																														// Mortar Gunner (note: Mortar is an assembled weapon, gunner carries weapon)
_MTRmount = "ACE_M252TripodProxy";																											// Mortar Assistant Gunner (note: Mortar is an assembled weapon, assistant carries bipod/tripd)
_MTRammoHE = "ACE_M252HE_CSWDM";
_MTRammoWP = "ACE_M252WP_CSWDM";
_MTRammoIL = "ACE_M252IL_CSWDM";																												// Mortar Assistant Gunner (note: Mortar is an assembled weapon, assistant carries bipod/tripd)

_RAA = "Strela"; _RAAmag = "Strela";																										// Rifleman AA (anti-air)

_SNrifle = "SVD"; _SNriflemag = "10Rnd_762x54_SVD";																							// Sniper

_mine = "Mine"; _satchel = "pipebomb";																										// Engineer

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;							// expecting name of unit; originally passed by using 'this' in unit init

// ====================================================================================

// PREPARE UNIT FOR GEAR ADDITION
// The following code removes all existing weapons and backpacks

removeBackpack _unit;
removeallweapons _unit;
_unit addweapon "NVGoggles";           // add universal NVG for this faction

//removeAllItems _unit;						// remove default items: map, compass, watch, radio (and GPS for team/squad leaders)
////_unit addweapon "ItemGPS";					// add universal GPS for this faction (nb: misc items not cleared
//_unit addweapon "ItemMap";				// etc
//_unit addweapon "ItemCompass";
//_unit addweapon "ItemRadio";
//_unit addweapon "ItemWatch";

// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_typeofUnit) do
{

// ====================================================================================

// LOADOUT: COMMANDER
	case "co":
	{
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_COriflemag
		{_unit addmagazine _glmag} foreach [1,2,3];
		{_unit addmagazine _glsmokewhite} foreach [1,2,3];
		_unit addweapon _glrifle;									//_COrifle
		{_unit addmagazine _pistolmag} foreach [1,2];
		_unit addweapon _pistol;		
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1];
		_unit addWeapon "Binocular_Vector";
		_unit addweapon "ItemGPS";
		
		_unit addWeapon _bagmedium;
			
		_success = [_unit, _glriflemag, 4] call ACE_fnc_PackMagazine;
		_success = [_unit, _smokegrenade, 1] call ACE_fnc_PackMagazine;
		_success = [_unit, _smokegrenadegreen, 1] call ACE_fnc_PackMagazine;
		_success = [_unit, _glmag, 2] call ACE_fnc_PackMagazine;
	};
  
// LOADOUT: DEPUTY COMMANDER AND SQUAD LEADER
	case "dc":
	{
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_DCriflemag
		{_unit addmagazine _glmag} foreach [1,2,3];
		{_unit addmagazine _glsmokewhite} foreach [1,2,3];
		_unit addweapon _glrifle;									//_DCrifle
		{_unit addmagazine _pistolmag} foreach [1,2];
		_unit addweapon _pistol;		
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1];
		_unit addWeapon "Binocular_Vector";
		_unit addweapon "ItemGPS";
		
		_unit addWeapon _bagmedium;
			
		_success = [_unit, _glriflemag, 4] call ACE_fnc_PackMagazine;
		_success = [_unit, _smokegrenade, 1] call ACE_fnc_PackMagazine;
		_success = [_unit, _smokegrenadegreen, 1] call ACE_fnc_PackMagazine;
		_success = [_unit, _glmag, 2] call ACE_fnc_PackMagazine;
	};  

// LOADOUT: MEDIC
	case "m":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];	
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1,2,3];	
		
		_unit addWeapon _bagmedium;
		
	};

// LOADOUT: FIRE TEAM LEADER
	case "ftl":
	{
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_FTLriflemag
		{_unit addmagazine _glmag} foreach [1,2,3,4];
		{_unit addmagazine _glsmokewhite} foreach [1,2,3,4];
		_unit addweapon _glrifle;									//_FTLrifle		
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1];
		_unit addweapon "Binocular";
		_unit addweapon "ItemGPS";
		
		_unit addWeapon _bagmedium;
			
		_success = [_unit, _glriflemag, 4] call ACE_fnc_PackMagazine;
		_success = [_unit, _glsmoke, 1] call ACE_fnc_PackMagazine;
		_success = [_unit, _glmag, 3] call ACE_fnc_PackMagazine;
	};		


// LOADOUT: AUTOMATIC RIFLEMAN
	case "ar":
	{
		{_unit addmagazine _ARmag} foreach [1,2,3,4,5];
		_unit addweapon _AR;
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
		{_unit addmagazine _pistolmag} foreach [1,2,3,4];
		_unit addweapon _pistol;
	};	
	
// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
	case "aar":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
		_unit addweapon _rifle;		
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
			
		_unit addWeapon _bagmedium;
			
		_success = [_unit, _riflemag, 4] call ACE_fnc_PackMagazine;
		_success = [_unit, _ARmag, 4] call ACE_fnc_PackMagazine;
	};				
	
// LOADOUT: RIFLEMAN (AT)	
	case "rat":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6,7,8];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade} foreach [1,2];		
		{_unit addmagazine _grenade} foreach [1,2];	
		_unit addweapon _RAT;
		{_unit addmagazine _RATmag} foreach [1,2];	
		
		_unit addWeapon _bagmedium;
			
		_success = [_unit, _carbinemag, 6] call ACE_fnc_PackMagazine;
		_success = [_unit, _grenade, 2] call ACE_fnc_PackMagazine;
	};		
	
// LOADOUT: SURFACE TO AIR MISSILE GUNNER 
	case "samg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6];
		_unit addweapon _carbine;
		{_unit addmagazine _RAAmag} foreach [1];				
		_unit addweapon _RAA;
	};			
	
// LOADOUT: ASSISTANT SURFACE TO AIR MISSILE GUNNER
	case "samag":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
		_unit addweapon _rifle;
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];

		_unit addWeapon _bagmedium;
		_success = [_unit, _RAAmag, 2] call ACE_fnc_PackMagazine;
	};			
	
// LOADOUT: MEDIUM MG GUNNER	
	case "mmgg":
	{
		{_unit addmagazine _MMGmag} foreach [1,2,3,4,5];
		_unit addweapon _MMG;		
		{_unit addmagazine _pistolmag} foreach [1,2,3,4];
		_unit addweapon _pistol;
	};			

// LOADOUT: MEDIUM MG ASSISTANT GUNNER	
	case "mmgag":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";	
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
		
		_unit addWeapon _bagmedium;
			
		_success = [_unit, _riflemag, 4] call ACE_fnc_PackMagazine;
		_success = [_unit, _grenade, 2] call ACE_fnc_PackMagazine;
		_success = [_unit, _smokegrenade, 2] call ACE_fnc_PackMagazine;
		_success = [_unit, _MMGmag, 2] call ACE_fnc_PackMagazine;
	};
	
// LOADOUT: HEAVY MG GUNNER
	case "hmgg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1];
		
		_unit addWeapon _HMG;
	};	
	
// LOADOUT: HEAVY MG ASSISTANT GUNNER
	case "hmgag":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		_unit addWeapon "Binocular_Vector";
		{_unit addmagazine _smokegrenade;} foreach [1];		
		
		_unit addWeapon _HMGmount;
	};		
	
// LOADOUT: HEAVY MG AMMO CARRIER
	case "hmgac":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3];
		_unit addweapon _carbine;
		_unit addWeapon "Binocular_Vector";
		{_unit addmagazine _smokegrenade;} foreach [1];		
		{_unit addmagazine _HMGammo;} foreach [1,2,3,4];		
			
		_unit addWeapon _bagmedium;
			
		_success = [_unit, _carbinemag, 5] call ACE_fnc_PackMagazine;
	};			

// LOADOUT: MEDIUM AT GUNNER
	case "matg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3];
		_unit addweapon _carbine;
		{_unit addmagazine _MATmag1} foreach [1,2];
		{_unit addmagazine _MATmag2} foreach [1];
		_unit addweapon _MAT;			
	};	
	
// LOADOUT: MEDIUM AT ASSISTANT GUNNER	
	case "matag":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		_unit addWeapon "Binocular_Vector";
		{_unit addmagazine _smokegrenade;} foreach [1];		

		_unit addWeapon _bagmedium;
			
		_success = [_unit, _MATmag1, 2] call ACE_fnc_PackMagazine;			
		_success = [_unit, _MATmag2, 2] call ACE_fnc_PackMagazine;	
			
	};	
	
// LOADOUT: HEAVY AT GUNNER
	case "hatg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1];	
		{_unit addmagazine _HATmag1} foreach [1];
		_unit addweapon _HAT;			
	};	
	
// LOADOUT: HEAVY AT ASSISTANT GUNNER	
	case "hatag":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";	
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _grenade} foreach [1];
			
		_unit addWeapon _bagmedium;
		
		_success = [_unit, _HATmag1, 2] call ACE_fnc_PackMagazine;	

	};		
	
// LOADOUT: MORTAR GUNNER
	case "mtrg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1];
		{_unit addmagazine _MTRammoHE;} foreach [1,2,3];
			
		_unit addWeapon _MTR;
	};	
	
// LOADOUT: MORTAR ASSISTANT GUNNER
	case "mtrag":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1];	
		{_unit addmagazine _MTRammoHE;} foreach [1,2,3];	
		_unit addWeapon "Binocular_Vector";			
			
		_unit addWeapon _MTRmount;
	};		
	
// LOADOUT: MORTAR AMMO CARRIER
	case "mtrac":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1];
		{_unit addmagazine _MTRammoHE;} foreach [1,2];			
		_unit addWeapon "Binocular_Vector";	

		_unit addWeapon _bagmedium;
			
		_success = [_unit, _MTRammoHE, 4] call ACE_fnc_PackMagazine;			
		_success = [_unit, _MTRammoWP, 2] call ACE_fnc_PackMagazine;
		
	};		
	
// LOADOUT: SNIPER
	case "sn":
	{
		{_unit addmagazine _SNriflemag} foreach [1,2];
		_unit addweapon _SNrifle;
		_unit addweapon "Binocular";
		{_unit addmagazine _smokegrenade;} foreach [1];
	};		
	
// LOADOUT: SPOTTER
	case "sp":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";	
		{_unit addmagazine _smokegrenade;} foreach [1];
	};			
	
// LOADOUT: GROUND VEHICLE CREW
	case "c":
	{
		{_unit addmagazine _smgmag} foreach [1,2,3,4];
		_unit addweapon _smg;
		{_unit addmagazine _smokegrenade;} foreach [1];
	};			
	
// LOADOUT: AIR VEHICLE PILOTS
	case "p":
	{
		{_unit addmagazine _smgmag} foreach [1,2,3,4];
		_unit addweapon _smg;
		{_unit addmagazine _smokegrenade} foreach [1,2];					
	};		
	
// LOADOUT: ENGINEER
	case "eng":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade} foreach [1];
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _satchel} foreach [1,2];
		{_unit addmagazine _mine} foreach [1];

		_unit addWeapon _bagmedium;
			
		_success = [_unit, _satchel, 2] call ACE_fnc_PackMagazine;			
		_success = [_unit, _mine, 1] call ACE_fnc_PackMagazine;
		_success = [_unit, _grenade, 2] call ACE_fnc_PackMagazine;			
		_success = [_unit, _smokegrenade, 2] call ACE_fnc_PackMagazine;

	};	
		
// LOADOUT: RIFLEMAN
	case "r":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7,8];
		_unit addweapon _rifle;
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		
		_unit addWeapon _bagmedium;
		
		_success = [_unit, _riflemag, 4] call ACE_fnc_PackMagazine;
		_success = [_unit, _grenade, 2] call ACE_fnc_PackMagazine;			
		_success = [_unit, _smokegrenade, 2] call ACE_fnc_PackMagazine;


	};

// LOADOUT: CARABINEER
	case "car":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6,7,8];
		_unit addweapon _carbine;
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		
		_unit addWeapon _bagmedium;
		
		_success = [_unit, _carbinemag, 4] call ACE_fnc_PackMagazine;
		_success = [_unit, _grenade, 2] call ACE_fnc_PackMagazine;			
		_success = [_unit, _smokegrenade, 2] call ACE_fnc_PackMagazine;

	};

// LOADOUT: SUBMACHINEGUNNER
	case "smg":
	{
		{_unit addmagazine _smgmag} foreach [1,2,3,4,5,6,7,8];
		_unit addweapon _smg;
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		
		_unit addWeapon _bagmedium;
		
		_success = [_unit, _smgmag, 4] call ACE_fnc_PackMagazine;
		_success = [_unit, _grenade, 2] call ACE_fnc_PackMagazine;			
		_success = [_unit, _smokegrenade, 2] call ACE_fnc_PackMagazine;

	};

// LOADOUT: GRENADIER
	case "gren":
	{
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7,8];
		_unit addweapon _glrifle;
		{_unit addmagazine _glmag} foreach [1,2,3,4,5,6];
		{_unit addmagazine _glsmokewhite} foreach [1,2];
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		
		_unit addWeapon _bagmedium;
		
		_success = [_unit, _glriflemag, 4] call ACE_fnc_PackMagazine;
		_success = [_unit, _grenade, 2] call ACE_fnc_PackMagazine;			
		_success = [_unit, _glmag, 2] call ACE_fnc_PackMagazine;
	};

// CARGO: CAR - room for 10 weapons and 50 cargo items
	case "v_car":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 2];
		_unit addMagazineCargoGlobal [_riflemag, 8];
		_unit addMagazineCargoGlobal [_glriflemag, 8];
		_unit addMagazineCargoGlobal [_carbinemag, 10];
		_unit addMagazineCargoGlobal [_armag, 5];
		_unit addMagazineCargoGlobal [_ratmag, 1];
		_unit addMagazineCargoGlobal [_grenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 4];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
	};	
	
// CARGO: TRUCK - room for 50 weapons and 200 cargo items
	case "v_tr":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 10];
		_unit addMagazineCargoGlobal [_riflemag, 40];
		_unit addMagazineCargoGlobal [_glriflemag, 40];
		_unit addMagazineCargoGlobal [_carbinemag, 40];
		_unit addMagazineCargoGlobal [_armag, 22];
		_unit addMagazineCargoGlobal [_ratmag, 6];
		_unit addMagazineCargoGlobal [_grenade, 12];
		_unit addMagazineCargoGlobal [_smokegrenade, 12];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 4];
		_unit addMagazineCargoGlobal [_glmag, 12];
		_unit addMagazineCargoGlobal [_glsmokewhite, 12];
	};
	
// CARGO: IFV - room for 10 weapons and 100 cargo items
	case "v_ifv":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 4];
		_unit addMagazineCargoGlobal [_riflemag, 20];
		_unit addMagazineCargoGlobal [_glriflemag, 20];
		_unit addMagazineCargoGlobal [_carbinemag, 20];
		_unit addMagazineCargoGlobal [_armag, 8];
		_unit addMagazineCargoGlobal [_ratmag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 8];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
	};
	
// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7];
		_unit addweapon _rifle;
		
		_unit selectweapon primaryweapon _unit;
				
		if (true) exitwith {player globalchat format ["DEBUG (f\common\folk_assignGear.sqf): Unit = %1. Gear template %2 does not exist, used Rifleman instead.",_unit,_typeofunit]};
   };


// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING
_unit selectweapon primaryweapon _unit;