/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.rested{
	if gruntMoveTimer <= 0 {
		gruntCanMove = true
		gruntMoveTimer = gruntMoveTimerMax
	}
	else{
		gruntMoveTimer -= 1
		gruntCanMove = false
	}
	
	// check if it collides with a human
	human = collision_circle(x, y, 16, obj_human, false, false)
	if human {
		instance_destroy(human)
	}

	// accerlerates unless reaches fastest limit
	if gruntMoveTimerMax > gruntMoveTimerLimit{
		gruntMoveTimerMax -= gruntMoveTimerAcc
	}
	else{
		gruntMoveTimerMax = gruntMoveTimerLimit
	}

	if gruntSpeed < gruntSpeedMax{
		gruntSpeed+=gruntSpeedAcc
	}
	else{
		gruntSpeed = gruntSpeedMax
		exhausted -= 1
	}
	// Minus 1 to exhausted coefficient, if it is 0, half the speed
	if exhausted == 0 {
		exhausted = room_speed * 3
		gruntSpeed *= 0.5
	}


	if gruntCanMove {
		// decide which direction to go 
		// store the length btw a potential grunt position and player
		disList = ds_list_create();
	
		uDis = point_distance(obj_player.x, obj_player.y, x, y-gruntSpeed)
		dDis = point_distance(obj_player.x, obj_player.y, x, y+gruntSpeed)
		lDis = point_distance(obj_player.x, obj_player.y, x-gruntSpeed, y)
		rDis = point_distance(obj_player.x, obj_player.y, x+gruntSpeed, y)
		ulDis = point_distance(obj_player.x, obj_player.y, x-gruntSpeed, y-gruntSpeed)
		urDis = point_distance(obj_player.x, obj_player.y, x+gruntSpeed, y-gruntSpeed)
		dlDis = point_distance(obj_player.x, obj_player.y, x-gruntSpeed, y+gruntSpeed)
		drDis = point_distance(obj_player.x, obj_player.y, x+gruntSpeed, y+gruntSpeed)

		if uDis<dDis and uDis<lDis and uDis<rDis and uDis<ulDis and uDis<urDis and uDis<dlDis and uDis<drDis{
			gruntDir = "u"
		}
		else if dDis<uDis and dDis<lDis and dDis<rDis and dDis<ulDis and dDis<urDis and dDis<dlDis and dDis<drDis{
			gruntDir = "d"
		}
		else if lDis<uDis and lDis<dDis and lDis<rDis and lDis<ulDis and lDis<urDis and lDis<dlDis and lDis<drDis{
			gruntDir = "l"
		}
		else if rDis<uDis and rDis<dDis and rDis<lDis and rDis<ulDis and rDis<urDis and rDis<dlDis and rDis<drDis{
			gruntDir = "r"
		}
		else if ulDis<uDis and ulDis<dDis and ulDis<lDis and ulDis<rDis and ulDis<urDis and ulDis<dlDis and ulDis<drDis{
			gruntDir = "ul"
		}
		else if urDis<uDis and urDis<dDis and urDis<lDis and urDis<rDis and urDis<ulDis and urDis<dlDis and urDis<drDis{
			gruntDir = "ur"
		}
		else if dlDis<uDis and dlDis<dDis and dlDis<lDis and dlDis<rDis and dlDis<ulDis and dlDis<urDis and dlDis<drDis{
			gruntDir = "dl"
		}
		else if drDis<uDis and drDis<dDis and drDis<lDis and drDis<rDis and drDis<ulDis and drDis<urDis and drDis<dlDis{
			gruntDir = "dr"
		}

	
		if gruntDir == "u"{
			y-=gruntSpeed
		}
		else if gruntDir == "d"{
			y+=gruntSpeed
		}
		else if gruntDir == "l"{
			x-=gruntSpeed
		}
		else if gruntDir == "r"{
			x+=gruntSpeed
		}
		else if gruntDir == "ul"{
			y-=gruntSpeed
			x-=gruntSpeed
		}
		else if gruntDir == "ur"{
			y-=gruntSpeed
			x+=gruntSpeed
		}
		else if gruntDir == "dl"{
			y+=gruntSpeed
			x-=gruntSpeed
		}
		else if gruntDir == "dr"{
			y+=gruntSpeed
			x+=gruntSpeed
		}
	}
} else {
	gruntSpeed = 5
}
