extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var players_on_end = []


signal lvl_change(lvl_name)

export (String) var lvl_name = "Level"
export (String) var n_lvl_name
export (String) var w_lvl_name
export (String) var s_lvl_name
export (String) var e_lvl_name


func _on_ToELevel_body_entered(body):
	#emit_signal("lvl_change", e_lvl_name)
	
	#print(players_on_end.find(body))
	if players_on_end.find(body) == -1:
		if (players_on_end.size() == 3):
			emit_signal("lvl_change", e_lvl_name)
		else:
			players_on_end.append(body)
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


