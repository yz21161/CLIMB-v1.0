extends CharacterBody2D
var frame = 0
var enemy_in_attack_range = false
var enemy_attack_cooldown = true
@export var health : float = 10000
var player_alive = true
var dash_state = false
#var attack_in_progress = false
@export var rock = false
@export var nSPEED : float = 300.0
@export var JUMP_VELOCITY : float = -250
signal custom_event
@export var friction: float = 10
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animation_locked : bool = false
var direction :Vector2 = Vector2.ZERO
var was_in_air : bool = false
var can_dash = true

func _physics_process(delta):
	
	
	play_dash_animation()
	enemy_attack()
	if health <= 0:
		player_alive = false
		health = 0
		print("player has died")
		self.queue_free()

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		was_in_air = true
		
		if was_in_air == true:
			land()
		was_in_air = false
	
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		print_debug("Jump")
		jump()
	direction = Input.get_vector("left","right","up","down") 
	if direction:
		velocity.x = direction.x * nSPEED
	else:
		velocity.x = move_toward(velocity.x, 0, nSPEED)
#	Handle Attack
	if Input.is_action_just_pressed("Dash") and can_dash :
#		var mouse_direction = get_local_mouse_position().normalized()
#		velocity = Vector2(1000 * mouse_direction.x, 500 * mouse_direction.y)
#		can_dash = false
#		await get_tree().create_timer(1).timeout
#		can_dash  = true
		dash()
		
	move_and_slide()
	update_animation()
	update_facing_direction()
	
func update_animation():
	if not animation_locked:
			if direction.x != 0:
				animated_sprite.play("Walking Animation")
			else:
				animated_sprite.play("Idle Animation")
			
func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
		
		
		
func dash():
#	velocity = Vector2()
	dash_state = true
	var dash_direction = get_local_mouse_position().normalized()
	velocity = Vector2(1500 * dash_direction.x, 500 * dash_direction.y)

	can_dash = false
	await get_tree().create_timer(1).timeout
	can_dash  = true
	dash_state = false
	
func play_dash_animation():
	if dash_state == true:
		animated_sprite.play("Dash Ball")
	
func jump():
	velocity.y = JUMP_VELOCITY
	animated_sprite.play("Jump Start Animation")
	animation_locked = true

func land():
	animated_sprite.play("Jump End Animation")
	animation_locked = true

func _on_animated_sprite_2d_animation_finished():
	if(animated_sprite.animation == "Jump End Animation"):
		animation_locked = false
	elif (animated_sprite.animation == "Attack End Animation"):
		animation_locked = false
func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = false

func enemy_attack():
	if enemy_in_attack_range and enemy_attack_cooldown == true:
		health = health - 10
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

	
	

	


	


func _on_deadzone_body_entered(body):
	velocity.x = 0
	velocity.y = 0
	global_position = Vector2(velocity.x,velocity.y)


func _on_freefall_body_entered(body):
	pass


func _on_area_2d_body_entered(body):
	velocity.x = 0
	velocity.y = 0
	global_position = Vector2(velocity.x,velocity.y)




func _on_trigger_body_entered(body):
	emit_signal("custom_event")


func _on_arrow_body_entered(body):
	velocity.x = 0
	velocity.y = 0
	global_position = Vector2(velocity.x,velocity.y)


func _on_boost_area_body_entered(body):
	var JUMP_VELOCITY = -400
	if animation_locked: true
	JUMP_VELOCITY = -250
