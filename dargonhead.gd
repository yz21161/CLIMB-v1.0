extends AnimatedSprite2D
@onready var dargonhead = $dargonhead



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func update_animation():
	print("hi")
	dargonhead.play("beam1")
	
	update_animation()
