extends Node2D

signal palancaActiva(palanca_name)
export (String) var palanca_name

export var state = "off"

func _ready():
	if state == "off":
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
		
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
		emit_signal("palancaActiva", palanca_name)
		
	if state == "off":
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
