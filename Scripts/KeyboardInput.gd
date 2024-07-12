# KeyboardInput.gd
extends Node

signal note_on(pitch, velocity)

var key_to_pitch = {
	KEY_A: 60, KEY_S: 62, KEY_D: 64, KEY_F: 65, KEY_G: 67,
	KEY_H: 69, KEY_J: 71, KEY_K: 72, KEY_L: 74
}

func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode in key_to_pitch:
			note_on.emit(key_to_pitch[event.keycode], 60)  # Middle velocity
