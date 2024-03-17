extends Area2D
signal hit

@export var speed = 400 # How fast the player will move in pixels/second
var screen_size # Size of the game window

# Runs when the node enters the scene tree
func _ready():
	hide()
	screen_size = get_viewport_rect().size # Gets the screen size

func _process(delta):
	var velocity = Vector2.ZERO # Set player movement to (0,0)
	# Add to velocity depending on direction pressed - y axis is backwards
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

	if (velocity.x != 0):
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0


func _on_body_entered(body):
	pass # Replace with function body.
