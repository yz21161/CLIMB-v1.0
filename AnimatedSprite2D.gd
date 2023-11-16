extends AnimatedSprite2D
@onready var animated_sprite_2d_2 = $"../AnimatedSprite2D2"
@onready var area_2d = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite_2d_2.play("beamm")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
