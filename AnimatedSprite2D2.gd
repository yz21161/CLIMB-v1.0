extends AnimatedSprite2D
@onready var animated_sprite_2d = $"../AnimatedSprite2D"


# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite_2d.play("beam")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
