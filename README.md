# Rogue Side

🎮 **Game 2D Action Roguelike Side-Scroller** berbasis Godot 4 + GDScript

**Versi Mobile-First** - Dioptimasi khusus untuk Android & iOS!

## 📱 Fitur Utama

✅ Player responsif dengan gerakan cepat & smooth  
✅ Dash, jump, combo attack, 2 kemampuan aktif  
✅ Enemy AI yang mengejar & menyerang  
✅ Mobile UI dengan 7 tombol kontrol di layar  
✅ Optimasi untuk portrait mode (HP vertikal)  
✅ EventBus system untuk komunikasi clean  
✅ Modular architecture siap dikembangkan  

## 🎮 Cara Bermain

| Tombol | Action |
|--------|--------|
| ◀ / ▶ | Bergerak kiri/kanan (tahan) |
| ↑ | Melompat |
| ⚔ | Serang (damage 18) |
| ⚡ | Dash (damage 30) |
| Q | Ability 1 - Slash Wave |
| E | Ability 2 - Burst |

## 🚀 Quick Start di Godot

### 1. Download & Install
```bash
# Clone repository
git clone https://github.com/azxgood0-cyber/godot-roguelike-action
cd godot-roguelike-action
```

### 2. Buka di Godot 4
- Download **Godot 4.2+** dari https://godotengine.org
- Buka Godot
- Pilih **Import**
- Arahkan ke folder project
- Pilih `project.godot`

### 3. Jalankan Game
- Tekan **F5** atau klik tombol Play
- Game berjalan di viewport

## 📂 Struktur Project

```
godot-roguelike-action/
├── project.godot              # Config Godot
├── icon.svg                   # Icon game
├── README.md                  # Dokumentasi ini
├── README_MOBILE.md          # Mobile-specific guide
│
├── scripts/
│   ├── autoload/
│   │   ├── EventBus.gd       # Global event system
│   │   └── GameManager.gd    # Game state
│   ├── core/
│   │   └── GameMobile.gd     # Main game controller
│   ├── entities/
│   │   ├── Actor.gd          # Base class
│   │   ├── Player.gd         # Player logic
│   │   └── Enemy.gd          # Enemy AI
│   └── ui/
│       └── MobileControls.gd # Mobile UI buttons
│
└── scenes/
    ├── MainMobile.tscn       # Main arena scene
    ├── Player.tscn           # Player scene
    ├── Enemy.tscn            # Enemy scene
    └── MobileControls.tscn   # Mobile UI scene
```

## ⚙️ Game Stats

### Player (Biru)
- HP: 100
- Damage: 18 (basic)
- Speed: 220
- Dash: 700 speed, 0.18 durasi
- Energy: 100 (regen 8/sec)

### Enemy (Merah)
- HP: 60
- Damage: 12
- Speed: 95
- Detection: 180px
- Attack: 0.8s cooldown

## 🔧 Development

### Tambah Enemy Type
```gdscript
extends Enemy

func _ready() -> void:
    super._ready()
    max_health = 120  # Lebih kuat
    attack_damage = 15
```

### Tambah Ability Baru
```gdscript
func use_ability_3() -> void:
    if energy < 40.0:
        return
    energy -= 40.0
    # Logic ability di sini
    EventBus.emit_ability_cast("ability_3")
```

### Tambah Room
```gdscript
func spawn_enemy(position: Vector2) -> void:
    var enemy = enemy_scene.instantiate()
    enemy.position = position
    add_child(enemy)

# Di _ready():
spawn_enemy(Vector2(200, -100))
spawn_enemy(Vector2(400, -100))
```

## 📦 Export ke APK

### Requirements
- Godot 4.2+
- Android SDK (via Android Studio)

### Steps
1. **Project → Export**
2. **Add Profile → Android**
3. Setup:
   - Package: `com.yourname.roguelike`
   - App Name: `Rogue Side`
4. **Export Project**
5. Pilih lokasi file APK
6. Tunggu (~2-5 menit)
7. Transfer ke HP & install

## 🎯 Roadmap

- [x] Base gameplay loop
- [x] Player movement & combat
- [x] Enemy AI
- [x] Mobile UI controls
- [ ] Room progression
- [ ] Enemy variants
- [ ] Item drop & relic system
- [ ] Upgrade shop
- [ ] Boss fight
- [ ] Sound & music
- [ ] Animation & VFX
- [ ] Save/load system

## 📚 Resources

- [Godot 4 Docs](https://docs.godotengine.org)
- [GDScript Reference](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
- [CharacterBody2D](https://docs.godotengine.org/en/stable/classes/class_characterbody2d.html)

## 🐛 Troubleshooting

**Q: Tombol tidak muncul?**  
A: Buka Output panel, cek error. Reload scene.

**Q: Game lag di HP?**  
A: Kurangi enemy count, atau turun FPS ke 30.

**Q: Player tidak terlihat?**  
A: Di Scene tree klik Player → Inspector check Visible.

## 📄 License

Free to use & modify!

## 👨‍💻 Made with Godot 4

Built with ❤️ for mobile gaming

**GitHub:** https://github.com/azxgood0-cyber/godot-roguelike-action
