/// @description Insert description here
// You can write your code in this editor

// if player died and restart the level, rearrange everything
if global.tryAgain == true{
	// if try again start rest timer
	global.restTimerStart = true
	randomize()
	// rearrange electrodes
	for (i=0; i<instance_number(obj_electrode); i++){
		currentElectrode = instance_find(obj_electrode,i)
		currentElectrode.x = random_range(global.margin*2, room_width-global.margin*2)
		currentElectrode.y = random_range(global.margin*2, room_height-global.margin*2)
	}
	
	// rearrange grunts
	for (i=0; i<instance_number(obj_grunt); i++){
		currentGrunt = instance_find(obj_grunt,i)
		currentGrunt.x = random_range(global.margin*2, room_width-global.margin*2)
		currentGrunt.y = random_range(global.margin*2, room_height-global.margin*2)
	}
	
	// rearrange human
	for (i=0; i<instance_number(obj_human); i++){
		currentHuman = instance_find(obj_human,i)
		currentHuman.x = random_range(room_width/5, room_width-room_width/5)
		currentHuman.y = random_range(room_height/5, room_height-room_height/5)
	}
	
	global.tryAgain = false
}