extends Node

signal player_damaged(amount: float)
signal player_healed(amount: float)
signal ability_cast(ability_name: String)
signal room_cleared(room_id: String)
signal enemy_died(enemy: Node)
signal item_picked(item: Node)
signal game_over()

func emit_player_damaged(amount: float) -> void:
    player_damaged.emit(amount)

func emit_player_healed(amount: float) -> void:
    player_healed.emit(amount)

func emit_ability_cast(ability_name: String) -> void:
    ability_cast.emit(ability_name)

func emit_room_cleared(room_id: String) -> void:
    room_cleared.emit(room_id)

func emit_enemy_died(enemy: Node) -> void:
    enemy_died.emit(enemy)

func emit_item_picked(item: Node) -> void:
    item_picked.emit(item)

func emit_game_over() -> void:
    game_over.emit()
