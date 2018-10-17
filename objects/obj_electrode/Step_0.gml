/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// kills the grunt if collide
nearGrunt = instance_nearest(x, y, obj_grunt)
if collision_rectangle(x-16, y-16, x+16, y+16, obj_grunt, true, false){
	instance_destroy()
	global.scores += obj_grunt.enemyScore
	audio_play_sound(snd_hitEnemy, 1, false)
	instance_destroy(nearGrunt)
}