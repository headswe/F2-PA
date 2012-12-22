_group = _this select 0;
_dest = _this select 1;
_dir = _this select 2;

_xoffset = 0;

_yoffset = 0;

{

	_xoffset = _xoffset + 2; 
		
	_x setpos [((_dest) select 0) + _xoffset, ((_dest) select 1) + _yoffset, ((_dest) select 2)];
	
	_x setDir (_dir);

		if (_xoffset > 9.5) then 
		{

			_xoffset = 0;

			_yoffset = _yoffset + 2;

		};

} foreach units _group;