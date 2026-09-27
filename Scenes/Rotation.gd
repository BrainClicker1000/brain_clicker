extends Path2D

@export var Self: Path2D
@export var speed = 10.0
var children
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	children = Self.get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child in children:
		child.progress += speed
