extends CanvasLayer

var button_size = 60
var spacing = 12

func _ready() -> void:
    var screen_w = get_viewport().get_visible_rect().size.x
    var screen_h = get_viewport().get_visible_rect().size.y

    var left_btn = create_button("◀", 15, screen_h - 110, "move_left")
    add_child(left_btn)

    var right_btn = create_button("▶", 90, screen_h - 110, "move_right")
    add_child(right_btn)

    var jump_btn = create_button("↑", 165, screen_h - 180, "jump")
    add_child(jump_btn)

    var attack_btn = create_button("⚔", screen_w - 80, screen_h - 110, "attack")
    add_child(attack_btn)

    var dash_btn = create_button("⚡", screen_w - 150, screen_h - 110, "dash")
    add_child(dash_btn)

    var ability1_btn = create_button("Q", screen_w - 80, screen_h - 180, "ability_1")
    add_child(ability1_btn)

    var ability2_btn = create_button("E", screen_w - 150, screen_h - 180, "ability_2")
    add_child(ability2_btn)

func create_button(text: String, x: float, y: float, action: String) -> Button:
    var btn = Button.new()
    btn.text = text
    btn.position = Vector2(x, y)
    btn.custom_minimum_size = Vector2(button_size, button_size)
    btn.add_theme_font_size_override("font_size", 20)
    btn.pressed.connect(func(): Input.action_press(action))
    btn.released.connect(func(): Input.action_release(action))
    return btn
