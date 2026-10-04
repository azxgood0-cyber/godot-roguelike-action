extends Actor
class_name Player

@export var dash_speed: float = 700.0
@export var dash_duration: float = 0.18
@export var attack_damage: float = 18.0
@export var energy_max: float = 100.0

var input_dir: float = 0.0
var can_dash: bool = true
var is_dashing: bool = false
var dash_timer: float = 0.0
var energy: float = 100.0
var attack_cooldown: float = 0.0

func _ready() -> void:
    super._ready()
    add_to_group("player")
    health = max_health
    energy = energy_max

func _physics_process(delta: float) -> void:
    super._physics_process(delta)
    handle_input()
    update_timings(delta)

    if is_on_floor() and velocity.y > 0.0:
        velocity.y = 0.0

func handle_input() -> void:
    if Input.is_action_pressed("move_left"):
        input_dir = -1.0
    elif Input.is_action_pressed("move_right"):
        input_dir = 1.0
    else:
        input_dir = 0.0

    if input_dir != 0.0:
        facing = sign(input_dir)

    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = -jump_force

    if Input.is_action_just_pressed("dash") and can_dash:
        start_dash()

    if Input.is_action_just_pressed("attack") and attack_cooldown <= 0.0:
        perform_attack()

    if Input.is_action_just_pressed("ability_1"):
        use_ability_1()

    if Input.is_action_just_pressed("ability_2"):
        use_ability_2()

    if not is_dashing:
        velocity.x = input_dir * move_speed

func update_timings(delta: float) -> void:
    attack_cooldown = max(0.0, attack_cooldown - delta)
    energy = min(energy_max, energy + delta * 8.0)

    if is_dashing:
        dash_timer -= delta
        if dash_timer <= 0.0:
            is_dashing = false
            can_dash = false
            velocity.x = input_dir * move_speed

func start_dash() -> void:
    is_dashing = true
    dash_timer = dash_duration
    velocity.x = facing * dash_speed

func perform_attack() -> void:
    attack_cooldown = 0.32
    var enemies = get_tree().get_nodes_in_group("enemy")
    for enemy in enemies:
        if not is_instance_valid(enemy):
            continue
        var distance := global_position.distance_to(enemy.global_position)
        if distance <= 70.0:
            enemy.apply_damage(attack_damage, Vector2(facing * 240.0, -150.0))
            break

func use_ability_1() -> void:
    if energy < 25.0:
        return
    energy -= 25.0
    var enemies = get_tree().get_nodes_in_group("enemy")
    for enemy in enemies:
        if not is_instance_valid(enemy):
            continue
        var distance := global_position.distance_to(enemy.global_position)
        if distance <= 120.0:
            enemy.apply_damage(30.0, Vector2(facing * 340.0, -210.0))

func use_ability_2() -> void:
    if energy < 35.0:
        return
    energy -= 35.0
    var enemies = get_tree().get_nodes_in_group("enemy")
    for enemy in enemies:
        if not is_instance_valid(enemy):
            continue
        var distance := global_position.distance_to(enemy.global_position)
        if distance <= 160.0:
            enemy.apply_damage(26.0, Vector2(facing * 260.0, -180.0))
