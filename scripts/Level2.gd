extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var players_on_end = []
var players_to_n = []
var players_to_s = []
var players_to_c = []

signal lvl_change(lvl_name)

export (String) var lvl_name = "Level"
export (String) var n_lvl_name
export (String) var w_lvl_name
export (String) var s_lvl_name
export (String) var e_lvl_name


#func _on_ToELevel_body_entered(body):
#	#print(players_on_end.find(body))
#	if players_on_end.find(body) == -1:
#		players_on_end.append(body)
#		if (players_on_end.size() == 1):
#			get_node("../../player_1/CollisionShape2D/Sprite").visible = false
#			get_node("Camera2D/AnimationPlayer").play("ELevel")
#			players_on_end.clear()
#	pass # Replace with function body.

#func _on_ToELevel_body_exited(body):
#	if players_on_end.find(body) != -1:
#		players_on_end.remove(players_on_end.find(body))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	
	print("GlitchStart?")
	
	if anim_name == "FromCToN":
		get_node("../../player_1").set_position(get_node("StartingPositionN").get_position())
	elif anim_name == "FromNToC":
		get_node("../../player_1").set_position(get_node("StartingPosition").get_position())
	elif anim_name == "FromCToS":
		get_node("../../player_1").set_position(get_node("StartingPositionS").get_position())
	elif anim_name == "FromSToC":
		get_node("../../player_1").set_position(get_node("StartingPosition").get_position())
		
	get_node("../../player_1/CollisionShape2D/Sprite").visible = true
	pass # Replace with function body.


func _on_ToNLevel_body_entered(body):
	if players_to_n.find(body) == -1:
		players_to_n.append(body)
		if (players_to_n.size() == 1):
			get_node("../../player_1/CollisionShape2D/Sprite").visible = false
			players_to_n.clear()
			get_node("Camera2D/AnimationPlayer").play("FromCToN")
	pass # Replace with function body.


func _on_ToNLevel_body_exited(body):
	if players_to_n.find(body) != -1:
		players_to_n.remove(players_to_n.find(body))


func _on_ToSLevel_body_entered(body):
	#print(players_on_end.find(body))
	if players_to_s.find(body) == -1:
		players_to_s.append(body)
		if (players_to_s.size() == 1):
			get_node("../../player_1/CollisionShape2D/Sprite").visible = false
			players_to_s.clear()
			get_node("Camera2D/AnimationPlayer").play("FromCToS")
	pass # Replace with function body.


func _on_ToSLevel_body_exited(body):
	if players_to_s.find(body) != -1:
		players_to_s.remove(players_to_s.find(body))


func _on_FromNtoC_body_entered(body):
	if players_to_c.find(body) == -1:
		players_to_c.append(body)
		if (players_to_c.size() == 1):
			get_node("../../player_1/CollisionShape2D/Sprite").visible = false
			players_to_c.clear()
			get_node("Camera2D/AnimationPlayer").play("FromNToC")
	pass # Replace with function body.


func _on_FromNtoC_body_exited(body):
	if players_to_c.find(body) != -1:
		players_to_c.remove(players_to_c.find(body))


func _on_FromStoC_body_entered(body):
	if players_to_c.find(body) == -1:
		players_to_c.append(body)
		if (players_to_c.size() == 1):
			get_node("../../player_1/CollisionShape2D/Sprite").visible = false
			players_to_c.clear()
			get_node("Camera2D/AnimationPlayer").play("FromSToC")
			#emit_signal("lvl_change", e_lvl_name)
	pass # Replace with function body.


func _on_FromStoC_body_exited(body):
	if players_to_c.find(body) != -1:
		players_to_c.remove(players_to_c.find(body))
