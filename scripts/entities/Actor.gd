extends CharacterBody2D
class_name Actor

signal died
signal health_changed(current_value: float, max_value: float)

@export var max_health: float = 100.0
@export var move_speed: float = 220.0
@export var gravity: float = 1200.0
@export var jump_force: float = 520.0

var health: float
var facing: int = 1
var is_alive: bool = true
var knockback_velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
    health = max_health
    if has_method("setup_collision"):
        setup_collision()

func _physics_process(delta: float) -> void:
    if not is_alive:
        return

    velocity.y += gravity * delta
    if knockback_velocity.length() > 0.1:
        velocity += knockback_velocity
        knockback_velocity = knockback_velocity.move_toward(Vector2.ZERO, 1200.0 * delta)

    move_and_slide()

func apply_damage(amount: float, knockback: Vector2 = Vector2.ZERO) -> void:
    if not is_alive:
        return

    health = max(0.0, health - amount)
    emit_signal("health_changed", health, max_health)
    knockback_velocity = knockback

    if health <= 0.0:
        die()

func die() -> void:
    is_alive = false
    emit_signal("died")
    queue_free()
