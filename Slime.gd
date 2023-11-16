extends CharacterBody2D

@export var speed : float = 100.0
var Jump_Velocity = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 100
var direction :Vector2 = Vector2.ZERO

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
#	move_enemy()

#func move_enemy():
#	direction = get_vector
#	if direction:
#		velocity.x = direction.x * speed
#	else:
#		velocity.x = move_toward(velocity.x, 0, speed)

func take_damage(damage_amount):
	health -= damage_amount
	if health <= 0:
		enemy_defeated()

func enemy_defeated():
	queue_free()
