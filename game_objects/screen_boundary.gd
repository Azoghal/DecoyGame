extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Left.position = Vector2(0,get_viewport_rect().size.y/2)
	$Right.position = Vector2(get_viewport_rect().size.x,get_viewport_rect().size.y/2)
	$Top.position = Vector2(get_viewport_rect().size.x/2,0)
	$Bottom.position = Vector2(get_viewport_rect().size.x/2,get_viewport_rect().size.y)
	print("Pos:", self.position)
	print("Left:", $Left.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
