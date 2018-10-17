/// @description Insert description here

if room == rm_start{
	// draw title
	draw_set_font(fnt_title)
	draw_set_color(make_color_rgb(random_range(0, 255), random_range(0, 255), random_range(0, 255)))
	draw_text(room_width/6, room_height/3, "Robotron Clone")
	
	// draw message
	draw_set_font(fnt_message)
	draw_text(room_width/6, room_height/2, "Press SPACE to play")
}
else if room == rm_level1{
	// draw rest counter
	if global.restTimerStart == true{
		draw_set_font(fnt_title)
		draw_set_color(make_color_rgb(random_range(0, 255), random_range(0, 255), random_range(0, 255)))
		draw_text(room_width/2-80, room_height/2-50, string(global.restTimer/room_speed))
	}
		
	// draw the bounding box
	draw_set_color(make_color_rgb(random_range(0, 255), random_range(0, 255), random_range(0, 255)))
	draw_rectangle(global.margin, global.margin, room_width-global.margin, room_height-global.margin, true)
	
	// draw score and lives
	draw_set_font(fnt_gui)
	draw_set_color(c_red)
	draw_text(50, 50, "Lives: "+string(global.playerLives))
	draw_text(50, 100, "Score: "+string(global.scores))
	
}
else if room == rm_end{
	// final message depends on whether passed the level
	draw_set_font(fnt_message)
	draw_set_color(make_color_rgb(random_range(0, 255), random_range(0, 255), random_range(0, 255)))
	if global.playerLives == 0{
		draw_text(room_width/6, room_height/3, "You lost!")
	}
	else if global.levelPassed == true{
		draw_text(room_width/6, room_height/3, "You passed!")
	}
	
	draw_text(room_width/6, room_height/2.5, "Your score was "+string(global.scores))
	draw_text(room_width/6, room_height/2, "Press SPACE to play again!")
}
