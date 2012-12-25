// ------------------------------------------------------------------------------------
// Alters radio frequencies per side, so that both teams have seperate radio channels.
// - PA
// ------------------------------------------------------------------------------------


if (!isDedicated) then {

  if (isNull player) then {
  	waitUntil {!isNull player};
  };
  
  _longrangechannels = ["ACRE_PRC148"] call acre_api_fnc_getDefaultChannels;
  _shortrangechannels = ["ACRE_PRC343"] call acre_api_fnc_getDefaultChannels;
  
	_vary = 30;
	_numy = 0;
	switch (side player) do 
	{ 
	  case west: {{ _x = _vary + 0.2; _longrangechannels set [_numy,_vary + 0.2];  _vary = _vary + 2; _numy = _numy + 1;}foreach _longrangechannels;}; 
	  case east: {{ _x = _vary + 0.4; _longrangechannels set [_numy,_vary + 0.4];  _vary = _vary + 2; _numy = _numy + 1;}foreach _longrangechannels;}; 
	  case resistance: {{ _x = _vary + 0.6; _longrangechannels set [_numy,_vary + 0.6];  _vary = _vary + 2; _numy = _numy + 1;}foreach _longrangechannels;}
	};
	
	_varx = 2400;
	_numx = 0;
	switch (side player) do 
	{ 
	  case west: {{ _x = _varx + 0.2; _shortrangechannels set [_numx,_varx + 0.2];  _varx = _varx + 2; _numx = _numx + 1;}foreach _shortrangechannels;}; 
	  case east: {{ _x = _varx + 0.4; _shortrangechannels set [_numx,_varx + 0.4];  _varx = _varx + 2; _numx = _numx + 1;}foreach _shortrangechannels;}; 
	  case resistance: {{ _x = _varx + 0.6; _shortrangechannels set [_numx,_varx + 0.6];  _varx = _varx + 2; _numx = _numx + 1;}foreach _shortrangechannels;}
	};
	
	_ret = ["ACRE_PRC148", _longrangechannels ] call acre_api_fnc_setDefaultChannels;
	_ret = ["ACRE_PRC148_UHF", _longrangechannels ] call acre_api_fnc_setDefaultChannels;
	_ret = ["ACRE_PRC119", _longrangechannels ] call acre_api_fnc_setDefaultChannels;
	_ret = ["ACRE_PRC117F", _longrangechannels ] call acre_api_fnc_setDefaultChannels;	
	_ret = ["ACRE_PRC152", _longrangechannels ] call acre_api_fnc_setDefaultChannels;
	
	_ret = ["ACRE_PRC343", _shortrangechannels ] call acre_api_fnc_setDefaultChannels;

 };