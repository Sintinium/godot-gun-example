extends Node2D

# Simple bullet to show how it should look.

# Direction the bullet should go. (Vector2)
var direction_normalized

# Speed the bullet moves per second.
var bullet_speed = 400

# Distance the bullet has currently traveled.
var distance = Vector2()

# Distance in which the bullet should despawn.
var max_distance = 250

func _process(delta):
	# Since we're in _process we need to multiply by delta so framerate doesn't matter.
	# We also scale the direction by the bullet speed.
	var velocity = direction_normalized * bullet_speed * delta
	
	position += velocity
	distance += velocity
	
	# Distance check so bullets get despawned.
	if abs(distance.x) > max_distance or abs(distance.y) > max_distance:
		queue_free()
