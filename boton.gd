extends Node2D

signal botonActiva(boton_name)
export (String) var boton_name

export var state = "off"
export var final_state = "off"

func _ready():
	if state == "off":
		$Sprite.texture = load("res://assets/ButtonOff.png")
	else:
		$Sprite.texture = load("res://assets/ButtonOn.png")
		
func _process(delta):
	
	if ($Area2D.overlaps_body($"../../../../../../player_1")
	and Input.is_action_just_pressed("use")):
	
	#or $Area2D.overlaps_body($"../../../../../../player_2")
	 #or $Area2D.overlaps_body($"../../../../../../player_3") or $Area2D.overlaps_body($"../../../../../../player_4")) 
	 
		
		if state == "off":
			state = "on"
		else:
			state = "off"
		
		print("trigger signal")
		emit_signal("botonActiva", boton_name)
		
	if state == "off":
		$Sprite.texture = load("res://assets/ButtonOff.png")
	else:
		$Sprite.texture = load("res://assets/ButtonOn.png")
