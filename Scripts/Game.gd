extends  Node2D

@export var MainBtn: TextureButton
@export var MoneyLabel: Label
@export var NuronLabel: Label
@export var MultiplyerLabel: Label

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
	MainBtn.pressed.connect(BtnClicked.bind(true))
	updateLabels()

func BtnClicked(IsPlayerClick) -> void:
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
	
