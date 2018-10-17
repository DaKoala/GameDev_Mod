// set boundaries
// left
if x <= global.margin{
	instance_destroy()
}
// right
if x >= room_width-global.margin{
	instance_destroy()
}
// top
if y <= global.margin{
	instance_destroy()
}
// bottom
if y >= room_height-global.margin{
	instance_destroy()
}

if playerBulletDir == "I" {
	image_angle = 90
	y-=playerBulletSpeed
}
else if playerBulletDir == "J" {
	image_angle = 180
	x-=playerBulletSpeed
}
else if playerBulletDir == "K" {
	image_angle = 270
	y+=playerBulletSpeed
}
else if playerBulletDir == "L" {
	image_angle = 0
	x+=playerBulletSpeed
}
else if playerBulletDir == "IJ" {
	image_angle = 135
	y-=playerBulletSpeed
	x-=playerBulletSpeed
}
else if playerBulletDir == "IL" {
	image_angle = 45
	y-=playerBulletSpeed
	x+=playerBulletSpeed
}
else if playerBulletDir == "KJ" {
	image_angle = 225
	y+=playerBulletSpeed
	x-=playerBulletSpeed
}
else if playerBulletDir == "KL" {
	image_angle = 315
	y+=playerBulletSpeed
	x+=playerBulletSpeed
}
