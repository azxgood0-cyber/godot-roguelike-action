extends Area2D
class_name Hurtbox

signal hit_received(damage_info: DamageInfo)

func _ready() -> void:
    monitoring = false
    monitorable = true
    collision_layer = 0
    collision_mask = 0

func receive_hit(damage_info: DamageInfo) -> void:
    emit_signal("hit_received", damage_info)
