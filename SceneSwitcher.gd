extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var curr_lvl = $Level1
onready var curr_tilemap = $Level1.get_node("CurrTileMap")


# Called when the node enters the scene tree for the first time.
func _ready():
	curr_lvl.connect("lvl_change", self, "lvl_change_hdlr")
	curr_lvl.get_node("Camera2D").make_current()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func lvl_change_hdlr(next_lvl_name: String):
	var next_level
	next_level = load("res://scenes/" + next_lvl_name + ".tscn").instance()
	
	add_child(next_level)
	
	
	pass

func _on_Level1_lvl_change(next_lvl_name):
	var next_level
	next_level = load("res://scenes/" + next_lvl_name + ".tscn").instance()
	
	add_child(next_level)
	curr_lvl.get_node("Camera2D/AnimationPlayer").play("ELevel")
	
	next_level.connect("lvl_change", self, "_on_Level1_lvl_change")
	next_level.get_node("Camera2D").make_current()
	curr_lvl.z_index = -1
	get_node("../player_1").set_position(next_level.get_node("StartingPosition").get_position())
	curr_lvl.queue_free()
	curr_lvl = next_level
	
	pass # Replace with function body.
