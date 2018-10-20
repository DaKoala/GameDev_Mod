/// @description Insert description here
// You can write your code in this editor

lifeTimer -= 1
if lifeTimer <= 0 {
	instance_destroy()
}

player = collision_circle(x, y, 10, obj_player, false, false)
if player {
	instance_destroy()
}