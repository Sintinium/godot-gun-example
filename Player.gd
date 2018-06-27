extends Node2D

var move_speed = 150

func _process(delta):
	_handle_movement(delta)
	_aim_gun()

# Handles aiming the gun.
func _aim_gun():
	# Set's the gun's rotation to look at the mouse.
	var mouse_pos = get_global_mouse_position()
	$Gun.look_at(mouse_pos)
	
	# Compare the mouse's position to this object's position.
	# If the mouse is in front we don't flip the texture.
	# Elif the mouse is behind we flip the texture.
	if mouse_pos.x > position.x:
		$Gun/GunSprite.flip_v = false
	elif mouse_pos.x < position.x:
		$Gun/GunSprite.flip_v = true
		
		
	# Another way to handle it is by using get_local_mouse_position().
    # Do note using this method only works inside the player object itself since the mouse position will be realtive to this one's.
	# 
	#	if get_local_mouse_position().x > 0:
	#    	$Gun/GunSprite.flip_v = false
	#	elif get_local_mouse_position().x < 0:
	#		$Gun/GunSprite.flip_v = true

# Allows you to move around so you can see this continues to work with movement.
func _handle_movement(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= move_speed * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += move_speed * delta
	
	if Input.is_action_pressed("ui_left"):
		position.x -= move_speed * delta
		# Flip the player's texture since we're moving left
		$PlayerSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		position.x += move_speed * delta
		# Un-flip the player's texture since we're moving right
		$PlayerSprite.flip_h = false