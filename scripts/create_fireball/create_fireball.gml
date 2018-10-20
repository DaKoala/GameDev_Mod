UP = 0
RIGHT = 1
DOWN = 2
LEFT = 3
dir = irandom_range(0, 3)

if dir == UP {
	pos_x = random_range(100, room_width - 100)
	pos_y = room_height + 50
} else if dir == DOWN {
	pos_x = random_range(100, room_width - 100)
	pos_y = -50
} else if dir == RIGHT {
	pos_x = -50
	pos_y = random_range(50, room_height - 50)
} else {
	pos_x = room_width + 50
	pos_y = random_range(50, room_height - 50)
}

fireball = instance_create_depth(pos_x, pos_y, 0, obj_fireball)
fireball.dir = dir