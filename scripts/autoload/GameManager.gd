extends Node

var current_run: Dictionary = {
    "seed": 0,
    "room_index": 0,
    "difficulty": 1.0,
    "relics": [],
    "weapon": "starter_blade"
}

func reset_run() -> void:
    current_run = {
        "seed": randi_range(1, 999999),
        "room_index": 0,
        "difficulty": 1.0,
        "relics": [],
        "weapon": "starter_blade"
    }

func advance_room() -> void:
    current_run["room_index"] += 1
    current_run["difficulty"] = 1.0 + (current_run["room_index"] * 0.12)
