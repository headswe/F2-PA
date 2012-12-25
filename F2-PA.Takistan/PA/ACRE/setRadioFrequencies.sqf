if (!isDedicated) then {

  if (isNull player) then {
  	waitUntil {!isNull player};
  };
  
  _longrangechannels = ["ACRE_PRC148"] call acre_api_fnc_getDefaultChannels;
  _shortrangechannels = ["ACRE_PRC343"] call acre_api_fnc_getDefaultChannels;
  
	switch (side player) do 
	{ 
	  case west: {{_x = _x + 0.2;}foreach _longrangechannels;}; 
	  case east: {{_x = _x + 0.4;}foreach _longrangechannels;}; 
	  case resistance: {{_x = _x + 0.6;}foreach _longrangechannels;}
	};

	switch (side player) do 
	{ 
	  case west: {{_x = _x + 0.2;}foreach _shortrangechannels;}; 
	  case east: {{_x = _x + 0.4;}foreach _shortrangechannels;}; 
	  case resistance: {{_x = _x + 0.6;}foreach _shortrangechannels;}
	};

 };