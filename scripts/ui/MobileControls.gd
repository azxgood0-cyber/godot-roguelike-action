extends CanvasLayer
class_name MobileControls

var button_size = 60
var spacing = 10
var bottom_margin = 20
var button_style: StyleBox

func _ready() -> void:
    # Background panel
    var bg = Panel.new()
    bg.custom_minimum_size = Vector2(get_viewport().get_visible_rect().size.x, 200)
    bg.anchor_left = 0.0
    bg.anchor_top = 1.0
    bg.anchor_right = 1.0
    bg.anchor_bottom = 1.0
    bg.offset_top = -200
    add_child(bg)
    
    # Stylebox untuk tombol
    button_style = StyleBoxFlat.new()
    button_style.set_bg_color(Color(0.3, 0.3, 0.3, 0.9))
    button_style.set_border_enabled_all(true)
    button_style.set_border_color_all(Color(0.8, 0.8, 0.8, 1.0))
    
    # Left side: Movement controls
    create_movement_buttons()
    
    # Right side: Action buttons
    create_action_buttons()

func create_movement_buttons() -> void:
    var start_y = get_viewport().get_visible_rect().size.y - 180
    var start_x = 10
    
    # Left button
    var left_btn = create_button("◀", start_x, start_y, "move_left")
    add_child(left_btn)
    
    # Right button
    var right_btn = create_button("▶", start_x + button_size + spacing, start_y, "move_right")
    add_child(right_btn)
    
    # Jump button
    var jump_btn = create_button("↑", start_x, start_y - button_size - spacing, "jump")
    add_child(jump_btn)

func create_action_buttons() -> void:
    var start_y = get_viewport().get_visible_rect().size.y - 180
    var start_x = get_viewport().get_visible_rect().size.x - button_size - 10
    
    # Attack button (largest, right side)
    var attack_btn = create_button("⚔", start_x, start_y, "attack")
    attack_btn.custom_minimum_size = Vector2(button_size + 10, button_size + 10)
    add_child(attack_btn)
    
    # Dash button
    var dash_btn = create_button("⚡", start_x - button_size - spacing, start_y, "dash")
    add_child(dash_btn)
    
    # Ability 1 button
    var ability1_btn = create_button("Q", start_x, start_y - button_size - spacing, "ability_1")
    add_child(ability1_btn)
    
    # Ability 2 button
    var ability2_btn = create_button("E", start_x - button_size - spacing, start_y - button_size - spacing, "ability_2")
    add_child(ability2_btn)

func create_button(text: String, x: float, y: float, action: String) -> Button:
    var btn = Button.new()
    btn.text = text
    btn.position = Vector2(x, y)
    btn.custom_minimum_size = Vector2(button_size, button_size)
    btn.add_theme_font_size_override("font_size", 24)
    
    # Handle hold/press untuk movement
    if action in ["move_left", "move_right", "jump"]:
        btn.pressed.connect(func(): Input.action_press(action))
        btn.released.connect(func(): Input.action_release(action))
    else:
        # Single press untuk action
        btn.pressed.connect(func(): Input.action_press(action))
        btn.released.connect(func(): Input.action_release(action))
    
    return btn
