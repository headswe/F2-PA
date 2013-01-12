// ------------------------------------------------------------------------------------
// Alters radio frequencies per side, so that both teams have seperate radio channels.
// ------------------------------------------------------------------------------------


if (!isDedicated) then {

  if (isNull player) then {
  	waitUntil {!isNull player};
  };
  
  _longrangechannels = ["ACRE_PRC148"] call acre_api_fnc_getDefaultChannels;
  _shortrangechannels = ["ACRE_PRC343"] call acre_api_fnc_getDefaultChannels;
  
	_lrbasefreq = 30;
	_numy = 0;
	switch (side player) do 
	{ 
	  case west: {{ _x = _lrbasefreq + 0.2; _longrangechannels set [_numy,_lrbasefreq + 0.2];  _lrbasefreq = _lrbasefreq + 2; _numy = _numy + 1;}foreach _longrangechannels;}; 
	  case east: {{ _x = _lrbasefreq + 0.4; _longrangechannels set [_numy,_lrbasefreq + 0.4];  _lrbasefreq = _lrbasefreq + 2; _numy = _numy + 1;}foreach _longrangechannels;}; 
	  case resistance: {{ _x = _lrbasefreq + 0.6; _longrangechannels set [_numy,_lrbasefreq + 0.6];  _lrbasefreq = _lrbasefreq + 2; _numy = _numy + 1;}foreach _longrangechannels;}
	};
	
	_srbasefreq = 2400;
	_numx = 0;
	switch (side player) do 
	{ 
	  case west: {{ _x = _srbasefreq + 0.2; _shortrangechannels set [_numx,_srbasefreq + 0.2];  _srbasefreq = _srbasefreq + 2; _numx = _numx + 1;}foreach _shortrangechannels;}; 
	  case east: {{ _x = _srbasefreq + 0.4; _shortrangechannels set [_numx,_srbasefreq + 0.4];  _srbasefreq = _srbasefreq + 2; _numx = _numx + 1;}foreach _shortrangechannels;}; 
	  case resistance: {{ _x = _srbasefreq + 0.6; _shortrangechannels set [_numx,_srbasefreq + 0.6];  _srbasefreq = _srbasefreq + 2; _numx = _numx + 1;}foreach _shortrangechannels;}
	};
	
	_ret = ["ACRE_PRC148", _longrangechannels ] call acre_api_fnc_setDefaultChannels;
	_ret = ["ACRE_PRC148_UHF", _longrangechannels ] call acre_api_fnc_setDefaultChannels;
	_ret = ["ACRE_PRC119", _longrangechannels ] call acre_api_fnc_setDefaultChannels;
	_ret = ["ACRE_PRC117F", _longrangechannels ] call acre_api_fnc_setDefaultChannels;	
	_ret = ["ACRE_PRC152", _longrangechannels ] call acre_api_fnc_setDefaultChannels;
	
	_ret = ["ACRE_PRC343", _shortrangechannels ] call acre_api_fnc_setDefaultChannels;

 };