extends KinematicBody2D

var selected = true

var lineal_vel = Vector2()
var speed = 300
var gravity = 15

var max_jumps = 1
var jumps = 0

var max_platform = 2
var platforms = 0

# What tilemap to use?
onready var tile_map : TileMap

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("personaje_1"):
		selected = true
		get_node("../player_2").selected = false
		get_node("../player_3").selected = false
		get_node("../player_4").selected = false
		
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	lineal_vel.y += gravity
	
	if not selected:
		lineal_vel.x = 0

	if selected:
		
		var on_floor = is_on_floor()	
		
		var target_vel = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		
		if Input.is_action_pressed("move_right"):
			print(tile_map)
			$CollisionShape2D/Sprite.flip_h = false
		if Input.is_action_pressed("move_left"):
			$CollisionShape2D/Sprite.flip_h = true
		
		if on_floor:
			jumps = 0
		
		if Input.is_action_just_pressed("jump") and jumps < max_jumps:
			lineal_vel.y = -2.0*speed 
			jumps += 1
		
		if Input.is_action_just_pressed("reset_scene"):
			get_tree().reload_current_scene()
		
		if on_floor:
			lineal_vel.x = lerp(lineal_vel.x, target_vel * speed, 0.5)
		else:
			lineal_vel.x = lerp(lineal_vel.x, target_vel * speed, 0.1)
		
		if Input.is_action_just_pressed("habilidad"):
			
			var plataforma_posicion = Vector2(int(get_global_mouse_position().x/16), int(get_global_mouse_position().y/16))
			if platforms < max_platform and tile_map.get_cellv(plataforma_posicion)==-1:
				tile_map.set_cellv(plataforma_posicion, 2)
				platforms += 1
			elif tile_map.get_cellv(plataforma_posicion) == 2 and platforms > 0:
				platforms -= 1
				tile_map.set_cellv(plataforma_posicion, -1)

				
			
	
	
