extends Actor
class_name Enemy

@export var detection_range: float = 180.0
@export var attack_range: float = 32.0
@export var attack_damage: float = 12.0

var player_ref: Node2D
var attack_cooldown: float = 0.0

func _ready() -> void:
    super._ready()
    player_ref = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
    super._physics_process(delta)
    if not is_alive:
        return

    attack_cooldown = max(0.0, attack_cooldown - delta)

    if player_ref == null:
        return

    var to_player: Vector2 = player_ref.global_position - global_position
    var distance: float = to_player.length()

    if distance <= detection_range:
        facing = 1 if to_player.x > 0 else -1
        if distance > attack_range:
            velocity.x = facing * move_speed * 0.7
        else:
            velocity.x = 0.0
            if attack_cooldown <= 0.0:
                attack_player()
    else:
        velocity.x = 0.0

func attack_player() -> void:
    attack_cooldown = 0.8
    if player_ref.has_method("apply_damage"):
        player_ref.apply_damage(attack_damage, Vector2(facing * 240.0, -180.0))

    EventBus.emit_ability_cast("enemy_attack")
