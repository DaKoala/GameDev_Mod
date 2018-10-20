/// @description Insert description here
// You can write your code in this editor

if dir == UP {
	y -= sped
} else if dir == RIGHT {
	x += sped	
} else if dir == LEFT {
	x -= sped
} else {
	y += sped
}

if x > room_width + 100 or x < -100 or y > room_height + 100 or y < -100 {
	instance_destroy();
}

enemy = collision_circle(x, y, 10, obj_enemy, false, false)
if enemy {
	instance_destroy(enemy)
}

human = collision_circle(x, y, 10, obj_enemy, false, false)
if enemy {
	instance_destroy(human)
}

player = collision_circle(x, y, 10, obj_player, false, false)
if player {
	lose_life()
}
	