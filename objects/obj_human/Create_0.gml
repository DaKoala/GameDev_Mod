/// @description Insert description here
// You can write your code in this editor

randomize()

// create humans at a random position closer to center
x = random_range(room_width/5, room_width-room_width/5)
y = random_range(room_height/5, room_height-room_height/5)

humanSpeed = 1
humanDir = irandom_range(1, 8)

// a timer to keep the intervals of human switch direction
humanCanChange = true
humanChangeTimer = 0
humanChangeTimerMax = 150
humanChangeTimer = humanChangeTimerMax

// a timer to prevent repetition in adding scores when player collide with human
playerCanSaveHuman = true
playerSaveHumanTimerMax = 1
playerSaveHumanTimer = playerSaveHumanTimerMax