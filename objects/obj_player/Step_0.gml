/// @description Insert description here
// You can write your code in this editor

// set movement boundaries
// left
if x <= global.margin*2{
	x = global.margin*2
}
// right
if x >= room_width-global.margin*2{
	x = room_width-global.margin*2
}
// top
if y <= global.margin*2{
	y = global.margin*2
}
// bottom
if y >= room_height-global.margin*2{
	y = room_height-global.margin*2
}

// if rested, player can perform actions
if global.rested {
	// player movements
	// W - up
	if keyboard_check(ord("W")){
		image_speed = 1
		y-=playerSpeed
		if keyboard_check(ord("A")){
			x-=playerSpeed
		}
		else if keyboard_check(ord("D")){
			x+=playerSpeed
		}
	}
	// S - down
	else if keyboard_check(ord("S")){
		image_speed = 1
		y+=playerSpeed
		if keyboard_check(ord("A")){
			x-=playerSpeed
		}
		else if keyboard_check(ord("D")){
			x+=playerSpeed
		}
	}
	// A - left
	else if keyboard_check(ord("A")){
		image_speed = 1
		x-=playerSpeed
		if keyboard_check(ord("W")){
			y-=playerSpeed
		}
		else if keyboard_check(ord("S")){
			y+=playerSpeed
		}
	}
	// D - right
	else if keyboard_check(ord("D")){
		image_speed = 1
		x+=playerSpeed
		if keyboard_check(ord("W")){
			y-=playerSpeed
		}
		else if keyboard_check(ord("S")){
			y+=playerSpeed
		}
	}
	// if nothing is pressed, sprite does not change
	else{
		image_speed = 0
		// frame number
		image_index = 0
	}

	// timer for shooting
	if playerShootTimer <= 0 {
		playerCanShoot = true
		playerShootTimer = playerShootTimerMax
	}
	else{
		playerShootTimer -= 1
		playerCanShoot = false
	}
	
	// check ammo
	if global.ammo <= 0 {
		playerCanShoot = false
	}

	if playerCanShoot==true{
		// player shooting directions I J K L IJ IL KJ KL
		if keyboard_check(ord("I")) 
		or keyboard_check(ord("K"))
		or keyboard_check(ord("J"))
		or  keyboard_check(ord("L")){
			// play shooting sound
			global.ammo -= 1
			audio_play_sound(snd_shoot, 1,false)
			
			// if player shoots, create an instance of bullet
			var bulletInst = instance_create_depth(x, y, 0, obj_playerBullet)
			with (bulletInst){
				// I - up
				if keyboard_check(ord("I")){
					playerBulletDir = "I"
					if keyboard_check(ord("J")){
						playerBulletDir = "IJ"
					}
					else if keyboard_check(ord("L")){
						playerBulletDir = "IL"
					}
				}
				// K - down
				else if keyboard_check(ord("K")){
					playerBulletDir = "K"
					if keyboard_check(ord("J")){
						playerBulletDir = "KJ"
					}
					else if keyboard_check(ord("L")){
						playerBulletDir = "KL"
					}
				}
				// J - left
				else if keyboard_check(ord("J")){
					playerBulletDir = "J"
					if keyboard_check(ord("I")){
						playerBulletDir = "IJ"
					}
					else if keyboard_check(ord("K")){
						playerBulletDir = "KJ"
					}
				}
				// L - right
				else if keyboard_check(ord("L")){
					playerBulletDir = "L"
					if keyboard_check(ord("I")){
						playerBulletDir = "IL"
					}
					else if keyboard_check(ord("K")){
						playerBulletDir = "KL"
					}
				}		
			}
		}
	}
}

