// play lose life sound
audio_play_sound(snd_loseLife, 1, false)
			
global.playerLives -= 1
// reset player position to middle
obj_player.x = room_width/2
obj_player.y = room_height/2
playerCanLoseLife = false
global.tryAgain = true