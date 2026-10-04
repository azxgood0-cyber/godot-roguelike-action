extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var hurtbox: Hurtbox = $Hurtbox

func _ready() -> void:
    add_to_group("enemy")
    if sprite:
        sprite.modulate = Color(1.0, 0.4, 0.4)
    if hurtbox:
        hurtbox.monitorable = true
        hurtbox.monitoring = true

func _physics_process(_delta: float) -> void:
    pass
