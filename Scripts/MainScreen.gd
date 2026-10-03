extends  Node2D

@export var MainBtn: TextureButton
@export var ShopBtn: Button
@export var ShopAncor: Node2D
@export var MoneyLabel: Label
@export var NuronLabel: Label
@export var MultiplyerLabel: Label
@export var Camera: Camera2D

@export var Money = 0.0
@export var Nurons = 86000000000
@export var Multiplyer = 0.5

var active_tween: Tween

func updateLabels() -> void:
	MoneyLabel.text = str(Money)
	NuronLabel.text = str(Nurons)
	MultiplyerLabel.text = str(Multiplyer)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainBtn.pressed.connect(MainBtnClicked.bind(true))
	ShopBtn.pressed.connect(ToShop)
	updateLabels()

func ToShop() -> void:
	var ShopAncor_Final_position = Vector2.ZERO
	ShopAncor_Final_position.x = ShopAncor.position.x + (get_window().size.x / 2)
	# Lock the Y position to the camera's current Y position
	ShopAncor_Final_position.y = Camera.position.y 
	
	var TransistionTween = create_tween()
	TransistionTween.tween_property(Camera, "position", ShopAncor_Final_position, 0.5).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD)

func MainBtnClicked(IsPlayerClick) -> void:
	Money += 1 * Multiplyer
	if IsPlayerClick:
		if active_tween and active_tween.is_valid():
			active_tween.kill()
		var GoofyTweenIn = create_tween()
		GoofyTweenIn.tween_property(MainBtn, "scale", Vector2(1.5, 1.5), 0.2).set_ease(Tween.EASE_IN)

		var GoofyTweenOut = create_tween()
		GoofyTweenOut.tween_property(MainBtn, "scale", Vector2(1.0, 1.0), 0.2).set_ease(Tween.EASE_OUT)

		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateLabels()
	
