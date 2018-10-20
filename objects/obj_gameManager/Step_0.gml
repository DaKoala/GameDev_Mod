/// @description Insert description here
// You can write your code in this editor
if room == rm_start{
	if keyboard_check_pressed(vk_space){
		room_goto(rm_level1)
	}
}
else if room == rm_level1{
	// if there is no grunts left, pass the level
	if instance_exists(obj_grunt)==false{
		global.levelPassed = true
	}
	
	// start the rest timer if revived
	if global.restTimerStart == true{
		if global.restTimer <= 0{
			global.rested = true
			global.restTimerStart = false
			global.restTimer = global.restTimerMax
		}
		else{
			global.restTimer -= 1
			global.rested = false
		}
	}
	
	if global.rested {
		fireTimer += 1
		if fireTimer == fireTimerMax {
			create_fireball()
			fireTimer = 0
		}
		
		ammoTimer += 1
		if ammoTimer == ammoTimerMax {
			create_ammo()
			ammoTimer = 0
		}
	}
	
	// check if loses or wins
	if global.playerLives == 0 or global.levelPassed == true{
		room_goto(rm_end)
	}
}
else if room == rm_end{
	// press space to go back to start screen
	if keyboard_check_pressed(vk_space){
		room_goto(rm_start)
		// reset everything
		global.playerLives = 3
		global.currentLevel = 1
		global.scores = 0

		global.humanSaved = 0

		global.levelPassed = false
		fireTimer = 0
		ammoTimer = 0

		// a boolean to keep track if player died and rearrange the level
		global.tryAgain = false
		// after rearrange, everything rest a while
		global.restTimerStart = false
		global.restTimer = 0
		global.restTimerMax = 90
		global.restTimer = global.restTimerMax
		global.rested = true
	}
}