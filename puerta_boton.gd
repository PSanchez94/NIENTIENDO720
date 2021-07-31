extends Node2D

export var estado = "off"
var estadoBotones = ""
var botones=[]

func _ready():
	botones = get_node("../ButtonsS").get_children()
	
	for boton in botones:
		print(boton.name, ' ', boton.state)


func _on_boton_botonActiva(boton_name):
	
	var estadoBotones = ""
	for boton in botones:
		print("palanca")
		print(boton.name)
		print(boton.name)
		estadoBotones += boton.state
		print(estadoBotones)
	if estado == estadoBotones:
		get_node("AnimationPlayer").play("OpenDoor")
	else:
		get_node("AnimationPlayer").play("CloseDoor")
