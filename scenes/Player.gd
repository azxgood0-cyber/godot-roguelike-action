extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var hurtbox: Hurtbox = $Hurtbox

func _ready() -> void:
    add_to_group("player")
    if sprite:
        sprite.modulate = Color(0.35, 0.8, 1.0)
    if hurtbox:
        hurtbox.monitorable = true
        hurtbox.monitoring = true

func _physics_process(_delta: float) -> void:
    pass
