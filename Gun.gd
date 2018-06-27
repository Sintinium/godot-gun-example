extends Node2D

# Example class of how shooting would work. Not important to answer.

# Preload our bullet scene.
onready var bullet_obj = preload("res://Bullet.tscn")

func _process(delta):
	# If the mouse is clicked create a new bullet using the _shoot() script.
	if Input.is_action_just_pressed("ui_click"):
		_shoot()

func _shoot():
	var new_bullet = bullet_obj.instance()
	get_node("/root/World").add_child(new_bullet)
	
	var mouse_pos = get_global_mouse_position()
	
	# Get the direction by subtracting the mouse position by the gun's position.
	var direction = mouse_pos - global_position
	
	# Set the newly created bullet's position to the gun's.
	new_bullet.position = $GunSprite.global_position
	
	# Set the bullet's direction in the 'Bullet.gd' script to be the direction normalized (between 0 and 1)
	new_bullet.direction_normalized = direction.normalized()