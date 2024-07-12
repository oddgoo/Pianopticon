# Pillar.gd
extends RigidBody3D

var base_height = 1.0
var max_additional_height = 5.0
var current_additional_height = 0.0
var raise_speed = 10.0
var lower_speed = 2.0

@onready var mesh = $MeshInstance3D

func _process(delta):
	if current_additional_height > 0:
		current_additional_height = max(0, current_additional_height - lower_speed * delta)
		_update_height()

func adjust_height(height):
	current_additional_height = min(max_additional_height, height)
	_update_height()

func _update_height():
	var scale = mesh.scale
	scale.y = base_height + current_additional_height
	mesh.scale = scale
	
	var pos = global_position
	pos.y = (base_height + current_additional_height) / 2
	global_position = pos
