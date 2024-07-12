# MainController.gd
extends Node

@onready var midi_input = $MIDIInput
@onready var keyboard_input = $KeyboardInput
@onready var pillar_raiser = $PillarRaiser

func _ready():
	print("MainController _ready called")
	
	if midi_input:
		print("MIDIInput found")
		midi_input.note_on.connect(_on_note_on)
		print("Connected to MIDIInput note_on signal")
	else:
		push_error("MIDIInput node not found")

	if keyboard_input:
		print("KeyboardInput found")
		keyboard_input.note_on.connect(_on_note_on)
		print("Connected to KeyboardInput note_on signal")
	else:
		push_error("KeyboardInput node not found")

func _on_note_on(pitch, velocity):
	print("Note on received: ", pitch, ", ", velocity)
	if pillar_raiser:
		pillar_raiser.raise_pillar(pitch, velocity)
	else:
		push_error("PillarRaiser node not found")
