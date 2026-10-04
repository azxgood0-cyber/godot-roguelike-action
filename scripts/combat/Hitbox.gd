extends Area2D
class_name Hitbox

@export var damage: float = 10.0
@export var knockback_strength: float = 120.0

func _ready() -> void:
    monitoring = true
    monitorable = false
    collision_layer = 0
    collision_mask = 0

func set_damage(value: float) -> void:
    damage = value

func get_damage() -> float:
    return damage
