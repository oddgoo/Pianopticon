# MIDIInput.gd
extends Node

signal note_on(pitch, velocity)

func _ready():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())
	print("MIDI Parser Ready")

func _input(input_event):
	if input_event is InputEventMIDI:
		_handle_midi_input(input_event)

func _handle_midi_input(midi_event):
	if midi_event.message == MIDI_MESSAGE_NOTE_ON:
		emit_signal("note_on", midi_event.pitch, midi_event.velocity)
