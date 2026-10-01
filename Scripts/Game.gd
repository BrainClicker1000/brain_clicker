extends  Node2D

@export var MainBtn: TextureButton
@export var MoneyLabel: Label
@export var NuronLabel: Label
@export var MultiplyerLabel: Label

@export var Money = 0.0
@export var Nurons = 86000000000
@export var Multiplyer = 1.0

func updateLabels() -> void:
	MoneyLabel.text = str(Money)
	NuronLabel.text = str(Nurons)
	MultiplyerLabel.text = str(Multiplyer)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateLabels()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateLabels()
	
