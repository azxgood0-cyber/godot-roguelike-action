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
    health = max_health
    energy = energy_max

func _physics_process(delta: float) -> void:
    super._physics_process(delta)
    handle_input()
    update_timings(delta)

    if is_on_floor() and velocity.y > 0.0:
        velocity.y = 0.0

func handle_input() -> void:
    input_dir = Input.get_axis("move_left", "move_right")
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
    EventBus.emit_ability_cast("dash")

func perform_attack() -> void:
    attack_cooldown = 0.32
    var hitbox: Hitbox = Hitbox.new()
    hitbox.position = Vector2(28 * facing, 0)
    hitbox.damage = attack_damage
    hitbox.knockback_strength = 160.0
    hitbox.monitoring = true
    add_child(hitbox)
    await get_tree().create_timer(0.08).timeout
    if is_instance_valid(hitbox):
        hitbox.queue_free()

func use_ability_1() -> void:
    if energy < 25.0:
        return
    energy -= 25.0
    velocity.x = facing * (move_speed + 150.0)
    EventBus.emit_ability_cast("slash_wave")

func use_ability_2() -> void:
    if energy < 35.0:
        return
    energy -= 35.0
    var burst: Hitbox = Hitbox.new()
    burst.position = Vector2(0, 0)
    burst.damage = 26.0
    burst.knockback_strength = 220.0
    add_child(burst)
    EventBus.emit_ability_cast("burst")
    await get_tree().create_timer(0.12).timeout
    if is_instance_valid(burst):
        burst.queue_free()
