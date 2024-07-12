# PillarRaiser.gd
extends Node

var pillars = []

func _ready():
	var pillars_node = get_node("../Pillars")
	
	# Collect references to manually placed pillar instances
	for i in range(15):
		var pillar = pillars_node.get_node("Pillar" + str(i))
		if pillar and pillar.has_method("adjust_height"):
			pillars.append(pillar)
		else:
			push_error("Pillar" + str(i) + " not found or is not a valid Pillar instance")

func raise_pillar(pitch, velocity):
	var index = _pitch_to_index(pitch)
	if index != -1 and index < pillars.size():
		var height = velocity / 127.0 * 5.0  # Max height of 5 units
		pillars[index].adjust_height(height)

func _pitch_to_index(pitch):
	if pitch < 48 or pitch > 72:
		return -1
	var white_keys = [0, 2, 4, 5, 7, 9, 11]
	var octave = (pitch - 48) / 12
	var key = (pitch - 48) % 12
	if key in white_keys:
		return octave * 7 + white_keys.find(key)
	return -1
