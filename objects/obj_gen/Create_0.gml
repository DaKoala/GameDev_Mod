/// @description Insert description here
// You can write your code in this editor

// produce electrodes
for (i=0; i<10; i++){
	instance_create_depth(x, y, 0, obj_electrode)
}

// produce grunts
for (i=0; i<15; i++){
	instance_create_depth(x, y, 0, obj_grunt)
}

// produce human
for (i=0; i<6; i++){
	instance_create_depth(x, y, 0, obj_human)
}