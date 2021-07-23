extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var curr_lvl = $Level1


# Called when the node enters the scene tree for the first time.
func _ready():
	curr_lvl.connect("lvl_changed", self, "lvl_change_hdlr")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func lvl_change_hdlr(next_lvl_name: String):
	var next_level
	
	next_level = load("res://scenes/" + next_lvl_name + ".tscn").instance()
	
	pass
