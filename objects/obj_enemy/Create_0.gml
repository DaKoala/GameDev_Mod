/// @description Insert description here
// You can write your code in this editor

randomize()

// every enemy is at random location with the margins
x = random_range(global.margin*2, room_width-global.margin*2)
y = random_range(global.margin*2, room_height-global.margin*2)

// a timer to keep track of when player can die & reborn
playerCanLoseLife = true
playerLoseLifeTimerMax = 1
playerLoseLifeTimer = playerLoseLifeTimerMax

enemyScore = 0