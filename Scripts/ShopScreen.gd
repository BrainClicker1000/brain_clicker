extends Node2D

@export var BackBtn: Button
@export var MainAncor: Node2D
@export var MoneyLabel: Label
@export var NuronLabel: Label
@export var MultiplyerLabel: Label
@export var Camera: Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BackBtn.pressed.connect(ToButton)
	pass # Replace with function body.

func ToButton() -> void:
	var ShopAncor_Final_position = Vector2.ZERO
	ShopAncor_Final_position.x = MainAncor.position.x + (get_window().size.x / 2)
	# Lock the Y position to the camera's current Y position
	ShopAncor_Final_position.y = Camera.position.y 
	
	var TransistionTween = create_tween()
	TransistionTween.tween_property(Camera, "position", ShopAncor_Final_position, 0.5).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
