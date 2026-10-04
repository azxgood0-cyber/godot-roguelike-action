extends Node2D

@onready var player_scene: PackedScene = preload("res://scenes/Player.tscn")
@onready var enemy_scene: PackedScene = preload("res://scenes/Enemy.tscn")

var player: Node2D

func _ready() -> void:
    spawn_player()
    spawn_enemy(Vector2(280, 0))
    spawn_enemy(Vector2(420, 0))

func spawn_player() -> void:
    player = player_scene.instantiate()
    player.position = Vector2(120, 0)
    add_child(player)
    setup_camera()

func spawn_enemy(position: Vector2) -> void:
    var enemy: Node2D = enemy_scene.instantiate()
    enemy.position = position
    add_child(enemy)

func setup_camera() -> void:
    var camera: Camera2D = Camera2D.new()
    camera.enabled = true
    camera.position_smoothing_enabled = true
    camera.position_smoothing_speed = 7.0
    player.add_child(camera)
