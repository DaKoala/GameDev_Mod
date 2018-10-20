/// @description Insert description here

// keep track of player life lost
if playerLoseLifeTimer <= 0 {
	playerCanLoseLife = true
	playerLoseLifeTimer = playerLoseLifeTimerMax
}
else{
	playerLoseLifeTimer -= 1
	playerCanLoseLife = false
}

// if there is still grunts left, player can shoot and lose life
if instance_exists(obj_grunt){
	// if player collide with any of the enemy, deduct one life
	if playerCanLoseLife{
		if collision_rectangle(x-16, y-16, x+16, y+16, obj_player, true, false){
			lose_life()
		}
	}

	// if player shot any enemy (except hulk), kills it
	nearPlayerBullet = instance_nearest(x, y, obj_playerBullet)
	if collision_rectangle(x-16, y-16, x+16, y+16, obj_playerBullet, true, false){
		instance_destroy()
		instance_destroy(nearPlayerBullet)
		global.scores += enemyScore
	}
}
