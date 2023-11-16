extends AnimatedSprite2D
@onready var dragonhead_2 =  $dragonhead2







# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func update_animation():
	print("hii")
	dragonhead_2.play("beam2")
	
	update_animation()
