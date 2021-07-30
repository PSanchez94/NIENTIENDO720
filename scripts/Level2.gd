extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var players_on_end = []
var players_to_n = []
var players_to_s = []


signal lvl_change(lvl_name)

export (String) var lvl_name = "Level"
export (String) var n_lvl_name
export (String) var w_lvl_name
export (String) var s_lvl_name
export (String) var e_lvl_name


func _on_ToELevel_body_entered(body):
	print(body)
	#print(players_on_end.find(body))
	if players_on_end.find(body) == -1:
		players_on_end.append(body)
		if (players_on_end.size() == 1):
			print("old emit signal")
			get_node("../../player_1/CollisionShape2D/Sprite").visible = false
			get_node("Camera2D/AnimationPlayer").play("ELevel")
		else:
			print(players_on_end)
	pass # Replace with function body.

func _on_ToELevel_body_exited(body):
	if players_on_end.find(body) != -1:
		players_on_end.remove(players_on_end.find(body))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	print("emit signal after animation finished")
	
	if anim_name == "FromCToN":
		get_node("../../player_1").set_position(get_node("StartingPositionN").get_position())
	elif anim_name == "FromNToC":
		get_node("../../player_1").set_position(get_node("StartingPosition").get_position())
	elif anim_name == "FromCToS":
		get_node("../../player_1").set_position(get_node("StartingPositionS").get_position())
	elif anim_name == "FromSToC":
		get_node("../../player_1").set_position(get_node("StartingPosition").get_position())
		
	get_node("../../player_1/CollisionShape2D/Sprite").visible = true
	#emit_signal("lvl_change", e_lvl_name)
	pass # Replace with function body.


func _on_ToNLevel_body_entered(body):
	#print(players_on_end.find(body))
	if players_to_n.find(body) == -1:
		players_to_n.append(body)
		if (players_to_n.size() == 1):
			get_node("../../player_1/CollisionShape2D/Sprite").visible = false
			get_node("Camera2D/AnimationPlayer").play("FromCToN")
			#emit_signal("lvl_change", e_lvl_name)
	pass # Replace with function body.


func _on_ToNLevel_body_exited(body):
	if players_to_n.find(body) != -1:
		players_to_n.remove(players_on_end.find(body))


func _on_ToSLevel_body_entered(body):
	#print(players_on_end.find(body))
	if players_to_s.find(body) == -1:
		players_to_s.append(body)
		if (players_to_s.size() == 1):
			get_node("../../player_1/CollisionShape2D/Sprite").visible = false
			get_node("Camera2D/AnimationPlayer").play("FromCToS")
			#emit_signal("lvl_change", e_lvl_name)
	pass # Replace with function body.



func _on_ToSLevel_body_exited(body):
	if players_to_s.find(body) != -1:
		players_to_s.remove(players_on_end.find(body))
