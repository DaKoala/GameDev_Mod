/// @description Insert description here

// the current human worth increases
// first human 100, second 200, etc
humanScore = 100+100*global.humanSaved

if global.rested{
	// this changes human direction at interval
	if humanChangeTimer <= 0 {
		humanCanChange = true
		humanChangeTimer = humanChangeTimerMax
	}
	else{
		humanChangeTimer -= 1
		humanCanChange = false
	}

	// if touch boundaries, change direction as well & reset timer
	if x <= global.margin*2{
		x = global.margin*2
		humanCanChange = true
		humanChangeTimer = humanChangeTimerMax
	}
	// right
	if x >= room_width-global.margin*2{
		x = room_width-global.margin*2
		humanCanChange = true
		humanChangeTimer = humanChangeTimerMax
	}
	// top
	if y <= global.margin*2{
		y = global.margin*2
		humanCanChange = true
		humanChangeTimer = humanChangeTimerMax
	}
	// bottom
	if y >= room_height-global.margin*2{
		y = room_height-global.margin*2
		humanCanChange = true
		humanChangeTimer = humanChangeTimerMax
	}

	// gives a random direction
	if humanCanChange{
		humanDir = irandom_range(1, 8)
	}

	// walking
	// up
	if humanDir == 1{
		y-=humanSpeed
	}
	// down
	else if humanDir == 2{
		y+=humanSpeed
	}
	// left
	else if humanDir == 3{
		x-=humanSpeed
	}
	// right
	else if humanDir == 4{
		x+=humanSpeed
	}
	// up left
	else if humanDir == 5{
		y-=humanSpeed
		x-=humanSpeed
	}
	// up right
	else if humanDir == 6{
		y-=humanSpeed
		x+=humanSpeed
	}
	// down left
	else if humanDir == 7{
		y+=humanSpeed
		x-=humanSpeed
	}
	// down right
	else if humanDir == 8{
		y+=humanSpeed
		x+=humanSpeed
	}	

	// keep track of player saved human
	if playerSaveHumanTimer <= 0 {
		playerCanSaveHuman = true
		playerSaveHumanTimer = playerSaveHumanTimerMax
	}
	else{
		playerSaveHumanTimer -= 1
		playerCanSaveHuman = false
	}

	// if player collide with human, gain score
	if playerCanSaveHuman == true{
		if collision_rectangle(x-12, y-16, x+12, y+16, obj_player, true, false){
			// play save sound
			audio_play_sound(snd_saveHuman, 1, false)
			
			global.scores += humanScore
			global.humanSaved += 1
			playerCanSaveHuman = false
			instance_destroy()
		}
	}
}
