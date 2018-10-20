/// @description Insert description here

global.playerLives = 3
global.currentLevel = 1
global.scores = 0

global.humanSaved = 0

global.levelPassed = false

// a boolean to keep track if player died and rearrange the level
global.tryAgain = false
// after rearrange, everything rest a while
global.restTimerStart = false
global.restTimer = 0
global.restTimerMax = 90
global.restTimer = global.restTimerMax
global.rested = true

// this is for drawing bounding box
global.margin = 20

global.ammo = 0

fireTimerMax = room_speed
fireTimer = 0

ammoTimerMax = room_speed * 10
ammoTimer = 0