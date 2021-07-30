extends Node2D

export var estado = "on"
var estadoPalancas = ""
var palancas=[]

func _ready():
	palancas = get_node("../Levers").get_children()
	
	for palanca in palancas:
		print(palanca.name, ' ', palanca.state)


func CheckCode():
	print("check palancas")
	
	var estadoPalancas = ""
	for palanca in palancas:
		estadoPalancas += palanca.state
	if estado == estadoPalancas:
		
		$"StaticBody2D/CollisionShape2D".disabled = true
	else:
		$"StaticBody2D/CollisionShape2D".disabled = false


func _on_Lever_palancaActiva(palanca_name):
	print("check palancas")
	
	var estadoPalancas = ""
	for palanca in palancas:
		print("palanca")
		print(palanca.name)
		print(palanca.name)
		estadoPalancas += palanca.state
		print(estadoPalancas)
	if estado == estadoPalancas:
		get_node("AnimationPlayer").play("OpenDoor")
	else:
		get_node("AnimationPlayer").play("CloseDoor")
