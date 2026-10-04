extends Node2D

@onready var player_scene: PackedScene = preload("res://scenes/Player.tscn")
@onready var enemy_scene: PackedScene = preload("res://scenes/Enemy.tscn")

var player: CharacterBody2D
var camera: Camera2D

func _ready() -> void:
    player = spawn_player()
    spawn_enemy(Vector2(0, -100))
    spawn_enemy(Vector2(200, -100))
    spawn_enemy(Vector2(400, -100))
    setup_camera()
    setup_mobile_ui()

func spawn_player() -> CharacterBody2D:
    var instance: CharacterBody2D = player_scene.instantiate()
    instance.position = Vector2(-200, -80)
    add_child(instance)
    return instance

func spawn_enemy(position: Vector2) -> void:
    var enemy: CharacterBody2D = enemy_scene.instantiate()
    enemy.position = position
    add_child(enemy)

func setup_camera() -> void:
    camera = Camera2D.new()
    camera.enabled = true
    camera.position_smoothing_enabled = true
    camera.position_smoothing_speed = 7.0
    camera.zoom = Vector2(1.2, 1.2)
    add_child(camera)
    camera.make_current()

func setup_mobile_ui() -> void:
    var mobile_ui = load("res://scenes/MobileControls.tscn")
    if mobile_ui:
        add_child(mobile_ui.instantiate())

func _process(_delta: float) -> void:
    if is_instance_valid(player) and camera:
        camera.global_position = player.global_position
