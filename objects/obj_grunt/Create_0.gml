/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
enemyScore = 100

// random range everything a little to make grunts not end up in the same position
gruntSpeed = 5
gruntSpeedAcc = random_range(8, 12)/100
gruntSpeedMax = random_range(12, 15)
gruntDir = "unknown"
exhausted = 3 * room_speed

// a timer to keep the intervals of grunt movement
gruntCanMove = true
gruntMoveTimer = 0
gruntMoveTimerMax = random_range(8, 12)
gruntMoveTimer = gruntMoveTimerMax
gruntMoveTimerAcc = random_range(8, 12)/100
gruntMoveTimerLimit = random_range(2, 4)
