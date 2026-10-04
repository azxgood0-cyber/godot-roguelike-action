# Rogue Side - Mobile Version

Game 2D Action Roguelike Side-Scroller untuk HP Android dan iOS.

## Fitur Utama
- Player responsive dengan gerakan cepat
- Dash, jump, combo attack, kemampuan aktif
- Enemy AI yang mengejar dan menyerang
- Mobile UI dengan 7 tombol kontrol di layar
- Optimasi untuk portrait mode (HP vertikal)
- EventBus system untuk komunikasi antar sistem

## Kontrol Mobile

### Tombol Kiri (Gerakan):
- ◀ **Left** - Bergerak ke kiri (tahan)
- ▶ **Right** - Bergerak ke kanan (tahan)
- ↑ **Jump** - Melompat (tahan/tekan)

### Tombol Kanan (Action):
- ⚔ **Attack** - Serang musuh terdekat
- ⚡ **Dash** - Teleport cepat ke depan
- Q **Ability 1** - Slash Wave (slash jarak medium)
- E **Ability 2** - Burst (ledakan di sekitar)

## Cara Membuka di Godot 4

1. **Download Godot 4** dari https://godotengine.org
2. **Clone project** atau download ZIP:
   ```bash
   git clone https://github.com/azxgood0-cyber/godot-roguelike-action
   cd godot-roguelike-action
   ```
3. **Buka di Godot:**
   - Klik **Import**
   - Arahkan ke folder project
   - Buka **project.godot**
4. **Jalankan game:**
   - Tekan **F5** atau klik tombol Play
   - Game akan berjalan di viewport dengan kontrol mobile

## Struktur File

```
scripts/
├── autoload/
│   ├── EventBus.gd       # Global event system
│   └── GameManager.gd    # Game state manager
├── core/
│   └── GameMobile.gd     # Main game controller (mobile)
├── entities/
│   ├── Actor.gd          # Base class untuk karakter
│   ├── Player.gd         # Player logic
│   └── Enemy.gd          # Enemy AI logic
└── ui/
    └── MobileControls.gd # UI tombol kontrol mobile

scenes/
├── MainMobile.tscn       # Main scene (portrait arena)
├── Player.tscn           # Player scene
├── Enemy.tscn            # Enemy scene
└── MobileControls.tscn   # Mobile UI scene
```

## Gameplay

1. **Tujuan:** Kalahkan semua musuh di arena
2. **HP:** Player 100, Enemy 60 HP
3. **Kemenangan:** Kalahkan semua enemy
4. **Kekalahan:** HP player habis

## Gameplay Mechanics

### Player (Biru)
- **HP:** 100
- **Damage/Attack:** 18
- **Speed:** 220
- **Dash:** 0.18 detik, damage 30
- **Energy:** Regenerasi otomatis

### Enemy (Merah)
- **HP:** 60
- **Damage/Attack:** 12
- **Speed:** 95
- **Detection Range:** 180 pixel
- **Attack Range:** 32 pixel

## Tips Bermain

1. **Gunakan Dash** untuk evade attack musuh
2. **Lompat dan gerak** untuk hindari serangan
3. **Gunakan ability** saat ada energy (Q dan E)
4. **Fokus satu musuh** sebelum lawan yang lain
5. **Jangan berdiri di tempat** - gerak terus!

## Export ke APK (Mobile)

### Requirement:
- Godot 4.2+
- Android SDK (via Android Studio)

### Langkah Export:
1. **Project → Export**
2. **Add Profile → Android**
3. Konfigurasi Android settings:
   - Package Name: `com.yourname.roguelike`
   - App Name: `Rogue Side`
4. **Export Project**
5. Pilih lokasi & tekan Export
6. Tunggu proses (~2-5 menit)
7. File `.apk` siap di-install di HP

## Development Notes

- Project dibuat dengan Godot 4.2+
- Optimized untuk mobile (portrait mode 540x960)
- Mobile UI dibuat di code (bukan dari editor)
- Menggunakan CharacterBody2D untuk physics
- Collision layer 2 untuk hitbox/hurtbox

## Next Steps

1. Tambah room progression
2. Tambah enemy variants (ranged, tank, etc)
3. Tambah item drop dan relic system
4. Tambah upgrade shop
5. Tambah boss fight
6. Tambah sound effects dan musik
7. Tambah animation dan VFX

## Troubleshooting

### Tombol tidak muncul?
- Buka **Godot Debug Console** (Output panel)
- Cek apakah ada error
- Reload scene atau project

### Game lag?
- Kurangi jumlah enemy di `GameMobile.gd`
- Buka **Project Settings → Physics → Physics Fps** ubah ke 30

### Player tidak terlihat?
- Di Scene tree, klik **Player**
- Di Inspector, cek **Visible** checkbox

## Kontribusi & Feedback

Untuk report bug atau feature request, buka **GitHub Issues** di:
https://github.com/azxgood0-cyber/godot-roguelike-action/issues

**Selamat bermain! 🎮**
