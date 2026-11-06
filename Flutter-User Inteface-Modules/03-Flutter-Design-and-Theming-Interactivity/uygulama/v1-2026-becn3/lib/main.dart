import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' show MaskFilter, BlurStyle, StrokeCap;
import 'package:material_ui/material_ui.dart';
import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ─────────────────────────────────────────────────────────────
//  LUMINA v2 – Dilek Fenerleri
//  Gökyüzü • Kayıtlılar • Profil (seviye, rozetler)
// ─────────────────────────────────────────────────────────────

void main() => runApp(const LuminaApp());

Color _a(Color c, double o) => c.withAlpha((o.clamp(0.0, 1.0) * 255).round());

// ───────────────────────── AYARLAR ─────────────────────────

class AppSettings extends ChangeNotifier {
  ThemeMode mode = ThemeMode.dark;
  int accentIndex = 0;
  int fontIndex = 0;
  bool particles = true;
  bool haptics = true;
  double floatSpeed = 1.0;
  double textScale = 1.0;
  bool phoneFrame = true;

  static const accents = [
    Color(0xFFFFB347),
    Color(0xFF7C83FF),
    Color(0xFF2EC4B6),
    Color(0xFFFF6B9A),
    Color(0xFF9BE564),
  ];
  static const fonts = ['Poppins', 'Playfair Display', 'Caveat', 'Space Mono'];
  static const fontLabels = ['Modern', 'Klasik', 'El Yazısı', 'Teknik'];

  Color get accent => accents[accentIndex];
  String get font => fonts[fontIndex];

  void setMode(ThemeMode m) {
    mode = m;
    notifyListeners();
  }

  void setAccent(int i) {
    accentIndex = i;
    notifyListeners();
  }

  void setFont(int i) {
    fontIndex = i;
    notifyListeners();
  }

  void setParticles(bool v) {
    particles = v;
    notifyListeners();
  }

  void setHaptics(bool v) {
    haptics = v;
    notifyListeners();
  }

  void setSpeed(double v) {
    floatSpeed = v;
    notifyListeners();
  }

  void setTextScale(double v) {
    textScale = v;
    notifyListeners();
  }

  void setPhoneFrame(bool v) {
    phoneFrame = v;
    notifyListeners();
  }
}

// ───────────────────────── MODELLER ─────────────────────────

const List<List<Color>> kPalettes = [
  [Color(0xFFFFB347), Color(0xFFFF6B6B)],
  [Color(0xFF7C83FF), Color(0xFFB388FF)],
  [Color(0xFF2EC4B6), Color(0xFF7BDFF2)],
  [Color(0xFFFF6B9A), Color(0xFFFFB3C6)],
  [Color(0xFF9BE564), Color(0xFFF7E463)],
];

class Comment {
  final String user;
  final String text;
  int likes;
  bool liked;
  Comment(this.user, this.text, {this.likes = 0, this.liked = false});
}

class Lantern {
  final int id;
  final String author;
  final String emoji;
  final String wish;
  final int palette;
  final int category; // 0..4  (AppData.cats[category + 1])
  int likes;
  bool liked;
  bool saved;
  double glow;
  final List<Comment> comments;

  Lantern({
    required this.id,
    required this.author,
    required this.emoji,
    required this.wish,
    required this.palette,
    required this.category,
    this.likes = 0,
    this.liked = false,
    this.saved = false,
    this.glow = 0.5,
    List<Comment>? comments,
  }) : comments = comments ?? [];

  List<Color> get colors => kPalettes[palette];
}

class FocusReq {
  final int id;
  final bool launch;
  FocusReq(this.id, {this.launch = false});
}

class Achievement {
  final IconData icon;
  final String title;
  final String desc;
  final bool Function(AppData) test;
  Achievement(this.icon, this.title, this.desc, this.test);
}

// ───────────────────────── UYGULAMA VERİSİ ─────────────────────────

class AppData extends ChangeNotifier {
  static const cats = ['Hepsi', 'Huzur', 'Aşk', 'Kariyer', 'Sağlık', 'Hayal'];
  static const catIcons = [
    Icons.auto_awesome_rounded,
    Icons.spa_rounded,
    Icons.favorite_rounded,
    Icons.work_rounded,
    Icons.health_and_safety_rounded,
    Icons.cloud_rounded,
  ];
  static const titles = [
    'Kıvılcım',
    'Mum Alevi',
    'Fener Çırağı',
    'Fener Ustası',
    'Gökyüzü Bekçisi',
    'Yıldız Toplayıcı',
    'Işık Efendisi',
  ];
  static const int perLevel = 15;

  final List<Lantern> lanterns = [
    Lantern(
      id: 1, author: 'Elif', emoji: '🌙', palette: 1, category: 4, likes: 128, glow: 0.7,
      wish: 'Bu yıl denizi ilk kez görecek annemle kıyıda oturmak istiyorum.',
      comments: [Comment('Burak', 'Çok güzel bir dilek, gerçek olsun 🌊', likes: 4)],
    ),
    Lantern(
      id: 2, author: 'Mert', emoji: '📚', palette: 2, category: 2, likes: 86, glow: 0.5,
      wish: 'Küçük bir kitapçı kafe açıp her gün kitap kokusuyla uyanmak.',
      comments: [Comment('Ayşe', 'İlk müşterin ben olurum!', likes: 7)],
    ),
    Lantern(
      id: 3, author: 'Zeynep', emoji: '🐾', palette: 0, category: 0, likes: 214, glow: 0.8,
      wish: 'Sokaktaki tüm kedilerin sıcak bir yuvası olsun.',
    ),
    Lantern(
      id: 4, author: 'Can', emoji: '🚀', palette: 3, category: 2, likes: 57, glow: 0.4,
      wish: 'Yazdığım ilk uygulamanın bir gün bir kişinin yüzünü güldürmesi.',
      comments: [Comment('Deniz', 'Bence şimdiden güldürdü 😄', likes: 2)],
    ),
    Lantern(
      id: 5, author: 'Selin', emoji: '🌱', palette: 4, category: 0, likes: 99, glow: 0.6,
      wish: 'Balkonumdaki fidelerin bu bahar çiçek açması.',
    ),
    Lantern(
      id: 6, author: 'Kaan', emoji: '💌', palette: 3, category: 1, likes: 143, glow: 0.65,
      wish: 'Yıllar sonra bile elini tuttuğumda ilk günkü gibi heyecanlanmak.',
    ),
    Lantern(
      id: 7, author: 'Deniz', emoji: '🏃', palette: 4, category: 3, likes: 72, glow: 0.45,
      wish: 'Bu yıl ilk yarı maratonumu bitirip sağlıklı kalmak.',
    ),
    Lantern(
      id: 8, author: 'Ayşe', emoji: '🎨', palette: 1, category: 4, likes: 61, glow: 0.55,
      wish: 'Resimlerimden oluşan küçük bir sergi açmak, hayal bu.',
    ),
    Lantern(
      id: 9, author: 'Berk', emoji: '🧘', palette: 2, category: 0, likes: 110, glow: 0.5,
      wish: 'Her sabah telefonuma bakmadan bir fincan çayla güne başlamak.',
    ),
  ];

  int stardust = 0;
  int likesGiven = 0;
  int commentsMade = 0;
  int wishesMade = 0;
  int swipes = 0;
  bool usedMaxGlow = false;
  void Function(int level, String title)? onLevelUp;

  int get level => 1 + stardust ~/ perLevel;
  double get progress => (stardust % perLevel) / perLevel;
  String get title => titles[(level - 1).clamp(0, titles.length - 1)];
  int get savedCount => lanterns.where((l) => l.saved).length;

  void addStardust(int n) {
    final before = level;
    stardust += n;
    notifyListeners();
    if (level > before) onLevelUp?.call(level, title);
  }

  void like(Lantern l, {bool onlyAdd = false}) {
    if (onlyAdd) {
      if (!l.liked) {
        l.liked = true;
        l.likes++;
        likesGiven++;
        addStardust(1);
      } else {
        notifyListeners();
      }
      return;
    }
    l.liked = !l.liked;
    if (l.liked) {
      l.likes++;
      likesGiven++;
      addStardust(1);
    } else {
      l.likes--;
      notifyListeners();
    }
  }

  void toggleSave(Lantern l) {
    l.saved = !l.saved;
    if (l.saved) {
      addStardust(1);
    } else {
      notifyListeners();
    }
  }

  void addComment(Lantern l, String text) {
    l.comments.insert(0, Comment('Sen', text));
    commentsMade++;
    addStardust(2);
  }

  void addWish(Lantern l) {
    lanterns.insert(0, l);
    wishesMade++;
    addStardust(5);
  }

  void remove(Lantern l) {
    lanterns.remove(l);
    notifyListeners();
  }

  void maxGlow(Lantern l) {
    l.glow = 1.0;
    usedMaxGlow = true;
    notifyListeners();
  }

  void noteSwipe() {
    swipes++;
    if (swipes % 5 == 0) {
      addStardust(1);
    }
  }
}

final List<Achievement> kAchievements = [
  Achievement(Icons.local_fire_department_rounded, 'İlk Kıvılcım', 'İlk dileğini bıraktın.', (d) => d.wishesMade >= 1),
  Achievement(Icons.favorite_rounded, 'Cömert Kalp', '5 dileği beğendin.', (d) => d.likesGiven >= 5),
  Achievement(Icons.forum_rounded, 'Sohbet Kuşu', '3 yorum yaptın.', (d) => d.commentsMade >= 3),
  Achievement(Icons.bookmarks_rounded, 'Koleksiyoncu', '3 feneri kaydettin.', (d) => d.savedCount >= 3),
  Achievement(Icons.explore_rounded, 'Gezgin', 'Gökyüzünde 10 kez kaydırdın.', (d) => d.swipes >= 10),
  Achievement(Icons.wb_twilight_rounded, 'Işık Büyücüsü', 'Bir feneri tam parlattın.', (d) => d.usedMaxGlow),
];

// ───────────────────────── UYGULAMA ─────────────────────────

class LuminaApp extends StatefulWidget {
  const LuminaApp({super.key});

  @override
  State<LuminaApp> createState() => _LuminaAppState();
}

class _LuminaAppState extends State<LuminaApp> {
  final AppSettings settings = AppSettings();
  final AppData data = AppData();

  ThemeData _theme(Brightness b) {
    final scheme = ColorScheme.fromSeed(seedColor: settings.accent, brightness: b);
    final base = ThemeData(useMaterial3: true, brightness: b, colorScheme: scheme);
    return base.copyWith(
      scaffoldBackgroundColor:
          b == Brightness.dark ? const Color(0xFF0B1026) : const Color(0xFFFFF7EC),
      textTheme: GoogleFonts.getTextTheme(settings.font, base.textTheme),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settings,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lumina',
        themeMode: settings.mode,
        theme: _theme(Brightness.light),
        darkTheme: _theme(Brightness.dark),
        builder: (context, child) {
          final mq = MediaQuery.of(context);
          final mobileNative = !kIsWeb &&
              (defaultTargetPlatform == TargetPlatform.android ||
                  defaultTargetPlatform == TargetPlatform.iOS);
          Widget app = Builder(
            builder: (c) => MediaQuery(
              data: MediaQuery.of(c).copyWith(textScaler: TextScaler.linear(settings.textScale)),
              child: child!,
            ),
          );
          if (settings.phoneFrame && !mobileNative && mq.size.width > 700) {
            app = PhoneFrame(child: app);
          }
          return app;
        },
        home: HomeShell(settings: settings, data: data),
      ),
    );
  }
}

// ───────────────────────── TELEFON ÇERÇEVESİ ─────────────────────────

class PhoneFrame extends StatelessWidget {
  final Widget child;
  const PhoneFrame({super.key, required this.child});

  static const double w = 390;
  static const double h = 844;
  static const double bezel = 12;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bar = isDark ? Colors.white : Colors.black87;

    return ColoredBox(
      color: const Color(0xFF05070F),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              width: w + bezel * 2,
              height: h + bezel * 2,
              padding: const EdgeInsets.all(bezel),
              decoration: BoxDecoration(
                color: const Color(0xFF111114),
                borderRadius: BorderRadius.circular(58),
                border: Border.all(color: const Color(0xFF34343A), width: 2.5),
                boxShadow: [
                  BoxShadow(color: _a(Colors.black, 0.7), blurRadius: 60, offset: const Offset(0, 24)),
                  BoxShadow(color: _a(const Color(0xFF7C83FF), 0.18), blurRadius: 90, spreadRadius: 4),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(46),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: MediaQuery(
                        data: mq.copyWith(
                          size: const Size(w, h),
                          padding: const EdgeInsets.only(top: 38, bottom: 22),
                          viewPadding: const EdgeInsets.only(top: 38, bottom: 22),
                          viewInsets: EdgeInsets.zero,
                        ),
                        child: child,
                      ),
                    ),
                    // Durum çubuğu
                    Positioned(
                      top: 12,
                      left: 30,
                      right: 30,
                      child: IgnorePointer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('9:41',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700, color: bar, decoration: TextDecoration.none)),
                            Row(
                              children: [
                                Icon(Icons.signal_cellular_alt_rounded, size: 14, color: bar),
                                const SizedBox(width: 4),
                                Icon(Icons.wifi_rounded, size: 14, color: bar),
                                const SizedBox(width: 4),
                                Icon(Icons.battery_full_rounded, size: 15, color: bar),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Çentik (dynamic island)
                    Positioned(
                      top: 9,
                      left: 0,
                      right: 0,
                      child: IgnorePointer(
                        child: Center(
                          child: Container(
                            width: 104,
                            height: 26,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Ana ekran çubuğu
                    Positioned(
                      bottom: 7,
                      left: 0,
                      right: 0,
                      child: IgnorePointer(
                        child: Center(
                          child: Container(
                            width: 120,
                            height: 4,
                            decoration: BoxDecoration(
                              color: _a(bar, 0.55),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ───────────────────────── ANA İSKELET ─────────────────────────

class HomeShell extends StatefulWidget {
  final AppSettings settings;
  final AppData data;
  const HomeShell({super.key, required this.settings, required this.data});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> with TickerProviderStateMixin {
  late final AnimationController _bg =
      AnimationController(vsync: this, duration: const Duration(seconds: 6))..repeat();
  late final AnimationController _shoot =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1300));
  late final AnimationController _tabFade =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 400), value: 1);

  final ValueNotifier<FocusReq?> _focus = ValueNotifier<FocusReq?>(null);
  late final ValueNotifier<List<Color>> _tint =
      ValueNotifier<List<Color>>(widget.data.lanterns.first.colors);

  final math.Random _rng = math.Random();
  double _shootSeed = 0.5;
  Timer? _shootTimer;
  Timer? _firstShoot;

  int _tab = 0;
  int _savedVer = 0;
  int _profVer = 0;
  int _nextId = 100;

  AppData get data => widget.data;
  AppSettings get settings => widget.settings;

  @override
  void initState() {
    super.initState();
    data.onLevelUp = _showLevelUp;
    _firstShoot = Timer(const Duration(seconds: 2), _fireShoot);
    _shootTimer = Timer.periodic(const Duration(seconds: 9), (_) => _fireShoot());
  }

  @override
  void dispose() {
    data.onLevelUp = null;
    _shootTimer?.cancel();
    _firstShoot?.cancel();
    _bg.dispose();
    _shoot.dispose();
    _tabFade.dispose();
    _focus.dispose();
    _tint.dispose();
    super.dispose();
  }

  void _fireShoot() {
    if (!mounted) return;
    _shootSeed = _rng.nextDouble();
    _shoot.forward(from: 0);
  }

  void _goTab(int i) {
    if (i == _tab) return;
    setState(() {
      _tab = i;
      if (i == 1) _savedVer++;
      if (i == 2) _profVer++;
    });
    _tabFade.forward(from: 0);
  }

  void _openLantern(Lantern l) {
    _goTab(0);
    _focus.value = FocusReq(l.id);
  }

  void _openSettings() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => SettingsSheet(settings: settings),
    );
  }

  Future<void> _newWish() async {
    final result = await showModalBottomSheet<Lantern>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => NewWishSheet(nextId: _nextId++),
    );
    if (result != null) {
      data.addWish(result);
      _goTab(0);
      _focus.value = FocusReq(result.id, launch: true);
    }
  }

  void _showLevelUp(int level, String title) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: 'Kapat',
        barrierColor: Colors.black54,
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (ctx, _, _) => LevelUpDialog(level: level, title: title),
        transitionBuilder: (ctx, anim, _, child) => ScaleTransition(
          scale: CurvedAnimation(parent: anim, curve: Curves.elasticOut),
          child: FadeTransition(opacity: anim, child: child),
        ),
      );
    });
  }

  void _toggleBrightness() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    settings.setMode(isDark ? ThemeMode.light : ThemeMode.dark);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final pages = <Widget>[
      SkyPage(data: data, settings: settings, focus: _focus, tint: _tint),
      SavedPage(key: ValueKey('saved$_savedVer'), data: data, onOpen: _openLantern),
      ProfilePage(key: ValueKey('prof$_profVer'), data: data, onSettings: _openSettings),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Center(
            child: ListenableBuilder(
              listenable: data,
              builder: (context, _) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: _a(cs.primary, 0.18),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _a(cs.primary, 0.45)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('✨', style: TextStyle(fontSize: 13)),
                    const SizedBox(width: 4),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      transitionBuilder: (c, a) => SlideTransition(
                        position: Tween<Offset>(begin: const Offset(0, 0.8), end: Offset.zero).animate(a),
                        child: FadeTransition(opacity: a, child: c),
                      ),
                      child: Text('${data.stardust}',
                          key: ValueKey(data.stardust),
                          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        title: Text('Lumina',
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, letterSpacing: 2)),
        actions: [
          IconButton(
            tooltip: 'Tema değiştir',
            onPressed: _toggleBrightness,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (c, a) => RotationTransition(turns: a, child: ScaleTransition(scale: a, child: c)),
              child: Icon(isDark ? Icons.wb_sunny_rounded : Icons.nightlight_round, key: ValueKey(isDark)),
            ),
          ),
          IconButton(
            tooltip: 'Görünüm ayarları',
            onPressed: _openSettings,
            icon: const Icon(Icons.palette_outlined),
          ),
        ],
      ),
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (c, a) => ScaleTransition(scale: a, child: c),
        child: _tab == 0
            ? FloatingActionButton.extended(
                key: const ValueKey('fab'),
                onPressed: _newWish,
                icon: const Icon(Icons.add_rounded),
                label: const Text('Dilek Bırak'),
                elevation: 8,
              )
            : const SizedBox.shrink(key: ValueKey('nofab')),
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: data,
        builder: (context, _) => NavigationBar(
          selectedIndex: _tab,
          onDestinationSelected: _goTab,
          backgroundColor: isDark ? const Color(0xFF0E1330) : Colors.white,
          destinations: [
            const NavigationDestination(
              icon: Icon(Icons.nightlight_outlined),
              selectedIcon: Icon(Icons.nightlight_round),
              label: 'Gökyüzü',
            ),
            NavigationDestination(
              icon: Badge(
                isLabelVisible: data.savedCount > 0,
                label: Text('${data.savedCount}'),
                child: const Icon(Icons.bookmark_border_rounded),
              ),
              selectedIcon: Badge(
                isLabelVisible: data.savedCount > 0,
                label: Text('${data.savedCount}'),
                child: const Icon(Icons.bookmark_rounded),
              ),
              label: 'Kayıtlılar',
            ),
            const NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded),
              label: 'Profil',
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ValueListenableBuilder<List<Color>>(
              valueListenable: _tint,
              builder: (context, c, _) => AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isDark
                        ? [const Color(0xFF0B1026), _a(c[1], 0.35), _a(c[0], 0.25)]
                        : [const Color(0xFFFFF7EC), _a(c[1], 0.30), _a(c[0], 0.30)],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _bg,
                builder: (context, _) => CustomPaint(
                  painter: StarPainter(_bg.value, isDark ? Colors.white : cs.primary, isDark),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _shoot,
                builder: (context, _) => CustomPaint(
                  painter: ShootingStarPainter(
                      _shoot.value, _shootSeed, isDark ? Colors.white : cs.primary),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 52),
              child: AnimatedBuilder(
                animation: _tabFade,
                builder: (context, child) {
                  final v = Curves.easeOutCubic.transform(_tabFade.value);
                  return Opacity(
                    opacity: v.clamp(0.0, 1.0),
                    child: Transform.translate(offset: Offset(0, (1 - v) * 18), child: child),
                  );
                },
                child: IndexedStack(index: _tab, children: pages),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────── GÖKYÜZÜ SAYFASI ─────────────────────────

class SkyPage extends StatefulWidget {
  final AppData data;
  final AppSettings settings;
  final ValueNotifier<FocusReq?> focus;
  final ValueNotifier<List<Color>> tint;
  const SkyPage({
    super.key,
    required this.data,
    required this.settings,
    required this.focus,
    required this.tint,
  });

  @override
  State<SkyPage> createState() => _SkyPageState();
}

class _SkyPageState extends State<SkyPage> with TickerProviderStateMixin {
  late final AnimationController _float =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
  late final AnimationController _spark =
      AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
  late final AnimationController _burst =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
  late final AnimationController _pulse =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
  late final AnimationController _launch =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1500), value: 1);

  int _filter = 0;
  int _index = 0;
  int _dir = 1;
  double _dragX = 0;
  bool _dragging = false;
  Offset _panTotal = Offset.zero;
  int _axis = 0; // 0 belirsiz, 1 yatay, 2 dikey
  int? _ptr;
  double _recentDx = 0;
  String _hint = 'İpucu: Çift dokun = beğen • Uzun bas = menü';

  AppData get data => widget.data;
  AppSettings get settings => widget.settings;

  List<Lantern> get _visible =>
      data.lanterns.where((l) => _filter == 0 || l.category == _filter - 1).toList();

  Lantern? get _cur {
    final v = _visible;
    if (v.isEmpty) return null;
    return v[_index.clamp(0, v.length - 1)];
  }

  @override
  void initState() {
    super.initState();
    data.addListener(_onData);
    settings.addListener(_applySpeed);
    widget.focus.addListener(_onFocus);
    _applySpeed();
  }

  @override
  void dispose() {
    data.removeListener(_onData);
    settings.removeListener(_applySpeed);
    widget.focus.removeListener(_onFocus);
    _float.dispose();
    _spark.dispose();
    _burst.dispose();
    _pulse.dispose();
    _launch.dispose();
    super.dispose();
  }

  void _applySpeed() {
    _float.duration = Duration(milliseconds: (3000 / settings.floatSpeed).round());
    _float.repeat(reverse: true);
  }

  void _fixIndex() {
    final n = _visible.length;
    _index = n == 0 ? 0 : _index.clamp(0, n - 1);
  }

  void _onData() {
    if (!mounted) return;
    setState(_fixIndex);
    _syncTint();
  }

  void _syncTint() {
    final l = _cur;
    if (l != null) widget.tint.value = l.colors;
  }

  void _onFocus() {
    final r = widget.focus.value;
    if (r == null) return;
    final idx = data.lanterns.indexWhere((e) => e.id == r.id);
    if (idx < 0) return;
    setState(() {
      _filter = 0;
      _dir = idx > _index ? 1 : -1;
      _index = idx;
      _hint = r.launch ? '🏮 Dileğin gökyüzüne bırakıldı!' : '🔖 Kayıtlı fener açıldı';
    });
    widget.tint.value = data.lanterns[idx].colors;
    if (r.launch) {
      _launch.forward(from: 0);
      _burst.forward(from: 0);
    }
  }

  void _hap({bool heavy = false}) {
    if (!settings.haptics) return;
    heavy ? HapticFeedback.heavyImpact() : HapticFeedback.mediumImpact();
  }

  // ── Jestler ──

  void _go(int delta) {
    final n = _visible.length;
    final target = _index + delta;
    if (target < 0 || target >= n) {
      setState(() => _hint = 'Gökyüzünün ucuna geldin ✨');
      return;
    }
    setState(() {
      _dir = delta > 0 ? 1 : -1;
      _index = target;
      _hint = delta > 0 ? '⬅️ Sola kaydırma: Sonraki fener' : '➡️ Sağa kaydırma: Önceki fener';
    });
    _syncTint();
    data.noteSwipe();
  }

  void _onTap() {
    _pulse.forward(from: 0);
    setState(() => _hint = '🌊 Dokunuş dalgası gönderildi');
  }

  void _onDoubleTap() {
    final l = _cur;
    if (l == null) return;
    _hap();
    data.like(l, onlyAdd: true);
    _burst.forward(from: 0);
    setState(() => _hint = '💖 Çift dokunuş: Dilek beğenildi!');
  }

  void _onLongPress() {
    final l = _cur;
    if (l == null) return;
    _hap(heavy: true);
    setState(() => _hint = '🏮 Uzun basma: Fener menüsü açıldı');
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.wb_twilight_rounded),
              title: const Text('Işığı tam parlat'),
              onTap: () {
                data.maxGlow(l);
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: Icon(l.saved ? Icons.bookmark_remove : Icons.bookmark_add_outlined),
              title: Text(l.saved ? 'Kaydı kaldır' : 'Kaydet'),
              onTap: () {
                data.toggleSave(l);
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy_rounded),
              title: const Text('Dileği kopyala'),
              onTap: () {
                Clipboard.setData(ClipboardData(text: l.wish));
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Dilek panoya kopyalandı')));
              },
            ),
            if (data.lanterns.length > 1)
              ListTile(
                leading: const Icon(Icons.delete_outline_rounded),
                title: const Text('Feneri gökyüzünden kaldır'),
                onTap: () {
                  data.remove(l);
                  Navigator.pop(ctx);
                },
              ),
          ],
        ),
      ),
    );
  }

  void _ptrDown(PointerDownEvent e) {
    _ptr = e.pointer;
    _panTotal = Offset.zero;
    _axis = 0;
    _recentDx = 0;
  }

  void _ptrMove(PointerMoveEvent e) {
    if (e.pointer != _ptr) return;
    _panTotal += e.delta;
    if (_axis == 0 && _panTotal.distance > 12) {
      _axis = _panTotal.dx.abs() > _panTotal.dy.abs() ? 1 : 2;
      if (_axis == 1) setState(() => _dragging = true);
    }
    if (_axis == 1) {
      final n = _visible.length;
      final atStart = _index <= 0 && e.delta.dx > 0;
      final atEnd = _index >= n - 1 && e.delta.dx < 0;
      final k = (atStart || atEnd) ? 0.35 : 1.0; // uçlarda direnç
      _recentDx = _recentDx * 0.7 + e.delta.dx * 0.3;
      setState(() => _dragX += e.delta.dx * k);
    } else if (_axis == 2) {
      final l = _cur;
      if (l == null) return;
      setState(() {
        l.glow = (l.glow - e.delta.dy / 250).clamp(0.0, 1.0);
        _hint = e.delta.dy < 0 ? '⬆️ Dikey sürükleme: Işık artıyor' : '⬇️ Dikey sürükleme: Işık azalıyor';
      });
    }
  }

  void _finish({bool cancel = false}) {
    if (_ptr == null) return;
    _ptr = null;
    final wasH = _axis == 1;
    final dx = _dragX;
    final fling = _recentDx;
    _axis = 0;
    _recentDx = 0;
    if (!wasH) return;
    setState(() {
      _dragging = false;
      _dragX = 0;
    });
    if (cancel) return;
    if (dx < -45 || fling < -7) {
      _go(1);
    } else if (dx > 45 || fling > 7) {
      _go(-1);
    }
  }

  void _openComments(Lantern l) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => CommentsSheet(lantern: l, data: data),
    );
  }

  // ── Arayüz ──

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final vis = _visible;
    final Lantern? l = vis.isEmpty ? null : vis[_index.clamp(0, vis.length - 1)];

    return Column(
      children: [
        _buildChips(),
        Expanded(child: l == null ? _buildEmpty(theme) : _buildSky(l, isDark, vis.length)),
        if (l != null) _buildPanel(l, theme, isDark, vis.length),
        const SizedBox(height: 76),
      ],
    );
  }

  Widget _buildChips() {
    return SizedBox(
      height: 46 * math.max(1.0, settings.textScale),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        itemCount: AppData.cats.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final count = i == 0
              ? data.lanterns.length
              : data.lanterns.where((e) => e.category == i - 1).length;
          return ChoiceChip(
            avatar: Icon(AppData.catIcons[i], size: 16),
            label: Text('${AppData.cats[i]} · $count'),
            selected: _filter == i,
            onSelected: (_) {
              setState(() {
                _filter = i;
                _index = 0;
                _dir = 1;
                _hint = i == 0 ? 'Tüm fenerler gösteriliyor' : '${AppData.cats[i]} dilekleri';
              });
              _syncTint();
            },
          );
        },
      ),
    );
  }

  Widget _buildEmpty(ThemeData theme) {
    return Center(
      child: AnimatedBuilder(
        animation: _float,
        builder: (context, _) => Transform.translate(
          offset: Offset(0, (_float.value - 0.5) * 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🌌', style: TextStyle(fontSize: 56)),
              const SizedBox(height: 12),
              Text('Bu kategoride henüz fener yok',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text('İlk dileği sen bırak!', style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSky(Lantern l, bool isDark, int count) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
      child: Listener(
        behavior: HitTestBehavior.opaque,
        onPointerDown: _ptrDown,
        onPointerMove: _ptrMove,
        onPointerUp: (_) => _finish(),
        onPointerCancel: (_) => _finish(cancel: true),
        child: Stack(
        alignment: Alignment.center,
        children: [
          // Ateş böcekleri
          if (settings.particles)
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedBuilder(
                  animation: _spark,
                  builder: (context, _) => CustomPaint(
                    painter: ParticlePainter(_spark.value, l.glow, l.colors[0]),
                  ),
                ),
              ),
            ),
          // Dokunuş dalgası
          IgnorePointer(
            child: AnimatedBuilder(
              animation: _pulse,
              builder: (context, _) {
                final t = _pulse.value;
                if (t == 0 || t == 1) return const SizedBox.shrink();
                return Opacity(
                  opacity: (1 - t).clamp(0.0, 1.0),
                  child: Container(
                    width: 120 + 240 * t,
                    height: 120 + 240 * t,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: l.colors[0], width: 3 * (1 - t) + 0.5),
                    ),
                  ),
                );
              },
            ),
          ),
          // Fener
          AnimatedContainer(
            duration: _dragging ? Duration.zero : const Duration(milliseconds: 300),
            curve: Curves.easeOutBack,
            transform: Matrix4.translationValues(_dragX, 0, 0)..rotateZ(_dragX / 1200),
            child: AnimatedBuilder(
              animation: Listenable.merge([_float, _launch]),
              builder: (context, child) {
                final fl = (_float.value - 0.5) * 22;
                final lv = Curves.easeOutCubic.transform(_launch.value);
                return Opacity(
                  opacity: (0.2 + 0.8 * lv).clamp(0.0, 1.0),
                  child: Transform.translate(
                    offset: Offset(0, fl + (1 - lv) * 280),
                    child: Transform.scale(scale: 0.6 + 0.4 * lv, child: child),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 450),
                    switchInCurve: Curves.easeOutCubic,
                    transitionBuilder: (child, anim) => FadeTransition(
                      opacity: anim,
                      child: SlideTransition(
                        position: Tween<Offset>(begin: Offset(_dir * 0.6, 0), end: Offset.zero).animate(anim),
                        child: ScaleTransition(
                          scale: Tween<double>(begin: 0.8, end: 1).animate(anim),
                          child: child,
                        ),
                      ),
                    ),
                    child: LanternBody(key: ValueKey(l.id), lantern: l),
                  ),
                ),
              ),
            ),
          ),
          // Kalp patlaması
          IgnorePointer(
            child: AnimatedBuilder(
              animation: _burst,
              builder: (context, _) {
                final t = Curves.easeOut.transform(_burst.value);
                if (_burst.value == 0) return const SizedBox.shrink();
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    for (int i = 0; i < 8; i++)
                      Transform.translate(
                        offset: Offset(math.cos(i * math.pi / 4) * t * 110,
                            math.sin(i * math.pi / 4) * t * 110 - t * 30),
                        child: Opacity(
                          opacity: (1 - t).clamp(0.0, 1.0),
                          child: Icon(Icons.favorite_rounded,
                              size: 18 + 22 * (1 - t), color: Colors.pinkAccent),
                        ),
                      ),
                    Opacity(
                      opacity: (1 - t).clamp(0.0, 1.0),
                      child: Transform.scale(
                        scale: 0.6 + t * 1.6,
                        child: const Icon(Icons.favorite_rounded, size: 90, color: Colors.pinkAccent),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // İpucu
          Positioned(
            top: 6,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Container(
                  key: ValueKey(_hint),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: _a(isDark ? Colors.white : Colors.black, 0.08),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(_hint,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ),
          // Işık göstergesi
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.light_mode_rounded, size: 18, color: l.colors[0]),
                  const SizedBox(height: 6),
                  Container(
                    width: 8,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _a(isDark ? Colors.white : Colors.black, 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: 8,
                      height: 100 * l.glow,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: l.colors),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [BoxShadow(color: _a(l.colors[0], 0.6), blurRadius: 8)],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text('${(l.glow * 100).round()}%',
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          // Önceki / sonraki
          Positioned(
            left: 8,
            bottom: 4,
            child: IconButton.filledTonal(
              tooltip: 'Önceki fener',
              onPressed: _index > 0 ? () => _go(-1) : null,
              icon: const Icon(Icons.chevron_left_rounded),
            ),
          ),
          Positioned(
            right: 8,
            bottom: 4,
            child: IconButton.filledTonal(
              tooltip: 'Sonraki fener',
              onPressed: _index < count - 1 ? () => _go(1) : null,
              icon: const Icon(Icons.chevron_right_rounded),
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildPanel(Lantern l, ThemeData theme, bool isDark, int count) {
    final cs = theme.colorScheme;
    final dots = count.clamp(1, 7);
    final dotIdx = count <= 1 ? 0 : (_index * (dots - 1) / (count - 1)).round();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
      decoration: BoxDecoration(
        color: isDark ? _a(Colors.white, 0.07) : _a(Colors.white, 0.88),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: _a(l.colors[0], 0.45), width: 1.2),
        boxShadow: [
          BoxShadow(color: _a(l.colors[0], 0.30), blurRadius: 28, offset: const Offset(0, 10)),
          BoxShadow(color: _a(Colors.black, isDark ? 0.35 : 0.08), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: _a(l.colors[0], 0.25),
                child: Text(l.emoji, style: const TextStyle(fontSize: 18)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(l.author,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _a(l.colors[0], 0.22),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(AppData.catIcons[l.category + 1], size: 13),
                    const SizedBox(width: 4),
                    Text(AppData.cats[l.category + 1],
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text('${_index + 1}/$count', style: theme.textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: 12),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: Text(
              l.wish,
              key: ValueKey(l.id),
              style: theme.textTheme.titleMedium?.copyWith(height: 1.4),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _ActionButton(
                icon: l.liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: l.liked ? Colors.pinkAccent : cs.onSurface,
                label: '${l.likes}',
                active: l.liked,
                onTap: () {
                  _hap();
                  data.like(l);
                },
              ),
              const SizedBox(width: 2),
              _ActionButton(
                icon: Icons.mode_comment_outlined,
                color: cs.onSurface,
                label: '${l.comments.length}',
                onTap: () => _openComments(l),
              ),
              const SizedBox(width: 2),
              _ActionButton(
                icon: l.saved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                color: l.saved ? cs.primary : cs.onSurface,
                label: l.saved ? 'Kayıtlı' : 'Kaydet',
                active: l.saved,
                onTap: () => data.toggleSave(l),
              ),
              const Spacer(),
              Row(
                children: List.generate(
                  dots,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: i == dotIdx ? 16 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: i == dotIdx ? l.colors[0] : _a(cs.onSurface, 0.25),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ───────────────────────── KAYITLILAR SAYFASI ─────────────────────────

class SavedPage extends StatefulWidget {
  final AppData data;
  final void Function(Lantern) onOpen;
  const SavedPage({super.key, required this.data, required this.onOpen});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final _search = TextEditingController();
  String _q = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return ListenableBuilder(
      listenable: widget.data,
      builder: (context, _) {
        final all = widget.data.lanterns.where((l) => l.saved).toList();
        final q = _q.toLowerCase();
        final items = all
            .where((l) => q.isEmpty || l.wish.toLowerCase().contains(q) || l.author.toLowerCase().contains(q))
            .toList();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: _Entrance(
                index: 0,
                child: TextField(
                  controller: _search,
                  onChanged: (v) => setState(() => _q = v),
                  decoration: InputDecoration(
                    hintText: 'Kayıtlı dileklerde ara...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: _q.isEmpty
                        ? null
                        : IconButton(
                            icon: const Icon(Icons.close_rounded),
                            onPressed: () {
                              _search.clear();
                              setState(() => _q = '');
                            },
                          ),
                    filled: true,
                    fillColor: isDark ? _a(Colors.white, 0.07) : _a(Colors.white, 0.85),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Expanded(
              child: items.isEmpty
                  ? Center(
                      child: _Entrance(
                        index: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('🔖', style: TextStyle(fontSize: 54)),
                            const SizedBox(height: 10),
                            Text(all.isEmpty ? 'Henüz kayıtlı fener yok' : 'Sonuç bulunamadı',
                                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: 4),
                            Text(all.isEmpty ? 'Gökyüzünde beğendiğin dilekleri kaydet.' : 'Başka bir şey dene.',
                                style: theme.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        final l = items[i];
                        return _Entrance(
                          index: i + 1,
                          child: Dismissible(
                            key: ValueKey('saved-${l.id}'),
                            direction: DismissDirection.endToStart,
                            onDismissed: (_) => widget.data.toggleSave(l),
                            background: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 24),
                              decoration: BoxDecoration(
                                color: _a(Colors.redAccent, 0.8),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Icon(Icons.bookmark_remove_rounded, color: Colors.white),
                            ),
                            child: GestureDetector(
                              onTap: () => widget.onOpen(l),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: isDark ? _a(Colors.white, 0.07) : _a(Colors.white, 0.9),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: _a(l.colors[0], 0.4)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: _a(l.colors[0], 0.22),
                                        blurRadius: 18,
                                        offset: const Offset(0, 6)),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 46,
                                      height: 56,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [_a(l.colors[1], 0.9), _a(l.colors[0], 0.95)],
                                        ),
                                        borderRadius: BorderRadius.circular(18),
                                        boxShadow: [
                                          BoxShadow(color: _a(l.colors[0], 0.5), blurRadius: 14),
                                        ],
                                      ),
                                      child: Text(l.emoji, style: const TextStyle(fontSize: 22)),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(l.author,
                                              style: theme.textTheme.titleSmall
                                                  ?.copyWith(fontWeight: FontWeight.w800)),
                                          const SizedBox(height: 4),
                                          Text(l.wish,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodyMedium),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      children: [
                                        const Icon(Icons.favorite_rounded, size: 16, color: Colors.pinkAccent),
                                        Text('${l.likes}', style: const TextStyle(fontSize: 11)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('Silmek için sola kaydır • Açmak için dokun',
                  style: theme.textTheme.bodySmall?.copyWith(color: _a(cs.onSurface, 0.6))),
            ),
          ],
        );
      },
    );
  }
}

// ───────────────────────── PROFİL SAYFASI ─────────────────────────

class ProfilePage extends StatelessWidget {
  final AppData data;
  final VoidCallback onSettings;
  const ProfilePage({super.key, required this.data, required this.onSettings});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final glass = isDark ? _a(Colors.white, 0.07) : _a(Colors.white, 0.9);

    return ListenableBuilder(
      listenable: data,
      builder: (context, _) {
        final toNext = AppData.perLevel - (data.stardust % AppData.perLevel);
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            _Entrance(
              index: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [_a(cs.primary, 0.35), _a(cs.secondary, 0.25)]),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: _a(cs.primary, 0.5)),
                  boxShadow: [
                    BoxShadow(color: _a(cs.primary, 0.3), blurRadius: 28, offset: const Offset(0, 10)),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: data.progress),
                        duration: const Duration(milliseconds: 1100),
                        curve: Curves.easeOutCubic,
                        builder: (context, v, _) => CustomPaint(
                          painter: RingPainter(v, cs.primary, _a(cs.onSurface, 0.12)),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('${data.level}',
                                    style: theme.textTheme.headlineMedium
                                        ?.copyWith(fontWeight: FontWeight.w900)),
                                Text('SEVİYE', style: theme.textTheme.labelSmall),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title,
                              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
                          const SizedBox(height: 6),
                          Text('Sonraki seviyeye $toNext ✨ kaldı', style: theme.textTheme.bodyMedium),
                          const SizedBox(height: 10),
                          FilledButton.tonalIcon(
                            onPressed: onSettings,
                            icon: const Icon(Icons.palette_outlined, size: 18),
                            label: const Text('Görünüm'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _Entrance(
              index: 1,
              child: Row(
                children: [
                  Expanded(child: _StatCard(Icons.local_fire_department_rounded, 'Dilek', data.wishesMade, glass)),
                  const SizedBox(width: 10),
                  Expanded(child: _StatCard(Icons.favorite_rounded, 'Beğeni', data.likesGiven, glass)),
                  const SizedBox(width: 10),
                  Expanded(child: _StatCard(Icons.forum_rounded, 'Yorum', data.commentsMade, glass)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _Entrance(
              index: 2,
              child: Text('Rozetler',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.88,
              children: [
                for (int i = 0; i < kAchievements.length; i++)
                  _Entrance(
                    index: 3 + i,
                    child: _BadgeTile(
                      achievement: kAchievements[i],
                      unlocked: kAchievements[i].test(data),
                      glass: glass,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 70),
          ],
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int value;
  final Color glass;
  const _StatCard(this.icon, this.label, this.value, this.glass);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: glass,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _a(theme.colorScheme.primary, 0.25)),
        boxShadow: [BoxShadow(color: _a(Colors.black, 0.12), blurRadius: 12, offset: const Offset(0, 5))],
      ),
      child: Column(
        children: [
          Icon(icon, color: theme.colorScheme.primary),
          const SizedBox(height: 6),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: value.toDouble()),
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOutCubic,
            builder: (context, v, _) => Text('${v.round()}',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
          ),
          Text(label, style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _BadgeTile extends StatelessWidget {
  final Achievement achievement;
  final bool unlocked;
  final Color glass;
  const _BadgeTile({required this.achievement, required this.unlocked, required this.glass});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${achievement.title}: ${achievement.desc}')),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: unlocked ? _a(cs.primary, 0.18) : glass,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: unlocked ? cs.primary : _a(cs.onSurface, 0.12), width: unlocked ? 1.6 : 1),
          boxShadow: unlocked
              ? [BoxShadow(color: _a(cs.primary, 0.45), blurRadius: 18, spreadRadius: 1)]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(achievement.icon,
                    size: 34, color: unlocked ? cs.primary : _a(cs.onSurface, 0.3)),
                if (!unlocked) Icon(Icons.lock_rounded, size: 14, color: _a(cs.onSurface, 0.6)),
              ],
            ),
            const SizedBox(height: 8),
            Text(achievement.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: unlocked ? cs.onSurface : _a(cs.onSurface, 0.5))),
          ],
        ),
      ),
    );
  }
}

class _Entrance extends StatelessWidget {
  final int index;
  final Widget child;
  const _Entrance({required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 380 + index.clamp(0, 10) * 90),
      curve: Curves.easeOutCubic,
      builder: (context, v, c) => Opacity(
        opacity: v.clamp(0.0, 1.0),
        child: Transform.translate(offset: Offset(0, (1 - v) * 24), child: c),
      ),
      child: child,
    );
  }
}

// ───────────────────────── SEVİYE ATLAMA ─────────────────────────

class LevelUpDialog extends StatefulWidget {
  final int level;
  final String title;
  const LevelUpDialog({super.key, required this.level, required this.title});

  @override
  State<LevelUpDialog> createState() => _LevelUpDialogState();
}

class _LevelUpDialogState extends State<LevelUpDialog> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 2400))..forward();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            IgnorePointer(
              child: SizedBox(
                width: 420,
                height: 560,
                child: AnimatedBuilder(
                  animation: _c,
                  builder: (context, _) => CustomPaint(painter: ConfettiPainter(_c.value)),
                ),
              ),
            ),
            Container(
              width: 290,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.brightness == Brightness.dark ? const Color(0xFF151B3B) : Colors.white,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: cs.primary, width: 2),
                boxShadow: [BoxShadow(color: _a(cs.primary, 0.6), blurRadius: 40, spreadRadius: 2)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('🎉', style: TextStyle(fontSize: 54)),
                  const SizedBox(height: 8),
                  Text('Seviye ${widget.level}!',
                      style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text('Yeni unvanın: ${widget.title}',
                      textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 18),
                  FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Harika!')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfettiPainter extends CustomPainter {
  final double t;
  ConfettiPainter(this.t);

  static const _colors = [
    Color(0xFFFFB347),
    Color(0xFFFF6B9A),
    Color(0xFF7C83FF),
    Color(0xFF2EC4B6),
    Color(0xFF9BE564),
    Color(0xFFFFE066),
  ];

  static final List<List<double>> _p = () {
    final r = math.Random(3);
    return List.generate(
        70, (i) => [r.nextDouble() * 2 * math.pi, 120 + r.nextDouble() * 260, 3 + r.nextDouble() * 4, r.nextDouble() * 6, i.toDouble()]);
  }();

  @override
  void paint(Canvas canvas, Size size) {
    final origin = Offset(size.width / 2, size.height / 2 - 40);
    for (final p in _p) {
      final dist = p[1] * Curves.easeOutCubic.transform(t);
      final pos = origin +
          Offset(math.cos(p[0]) * dist, math.sin(p[0]) * dist + 260 * t * t);
      final paint = Paint()..color = _a(_colors[p[4].toInt() % _colors.length], 1 - t * t);
      canvas.save();
      canvas.translate(pos.dx, pos.dy);
      canvas.rotate(p[3] * t * 3);
      canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: p[2] * 1.8, height: p[2]), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(ConfettiPainter old) => old.t != t;
}

class RingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color track;
  RingPainter(this.progress, this.color, this.track);

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.width / 2 - 8;
    canvas.drawCircle(
        c,
        r,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10
          ..color = track);
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: r),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round
        ..color = color,
    );
  }

  @override
  bool shouldRepaint(RingPainter old) => old.progress != progress || old.color != color;
}

// ───────────────────────── FENER GÖVDESİ ─────────────────────────

class LanternBody extends StatelessWidget {
  final Lantern lantern;
  const LanternBody({super.key, required this.lantern});

  @override
  Widget build(BuildContext context) {
    final c = lantern.colors;
    final g = lantern.glow;
    final capColor = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF3B2A1E)
        : const Color(0xFF6B4A32);

    return SizedBox(
      width: 170,
      height: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 3, height: 18, color: _a(capColor, 0.7)),
          Container(
            width: 96,
            height: 14,
            decoration: BoxDecoration(color: capColor, borderRadius: BorderRadius.circular(8)),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 130,
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [_a(c[1], 0.55 + 0.45 * g), _a(c[0], 0.65 + 0.35 * g)],
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.elliptical(70, 60),
                bottom: Radius.elliptical(50, 40),
              ),
              boxShadow: [
                BoxShadow(
                  color: _a(c[0], 0.25 + 0.55 * g),
                  blurRadius: 25 + 70 * g,
                  spreadRadius: 2 + 22 * g,
                ),
                BoxShadow(color: _a(Colors.black, 0.25), blurRadius: 10, offset: const Offset(0, 8)),
              ],
            ),
            child: Center(
              child: AnimatedScale(
                scale: 0.9 + 0.3 * g,
                duration: const Duration(milliseconds: 250),
                child: Text(lantern.emoji, style: const TextStyle(fontSize: 52)),
              ),
            ),
          ),
          Container(
            width: 70,
            height: 12,
            decoration: BoxDecoration(color: capColor, borderRadius: BorderRadius.circular(8)),
          ),
          Container(width: 2, height: 22, color: _a(capColor, 0.7)),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: c[0], shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────── ARKA PLAN EFEKTLERİ ─────────────────────────

class StarPainter extends CustomPainter {
  final double t;
  final Color color;
  final bool isDark;
  StarPainter(this.t, this.color, this.isDark);

  static final List<List<double>> _stars = () {
    final r = math.Random(7);
    return List.generate(
        80, (_) => [r.nextDouble(), r.nextDouble(), r.nextDouble() * 1.6 + 0.6, r.nextDouble()]);
  }();

  @override
  void paint(Canvas canvas, Size size) {
    for (final s in _stars) {
      final tw = 0.5 + 0.5 * math.sin(2 * math.pi * (t + s[3]));
      final o = (isDark ? 0.2 : 0.08) + (isDark ? 0.8 : 0.3) * tw;
      canvas.drawCircle(
        Offset(s[0] * size.width, s[1] * size.height * 0.75),
        s[2],
        Paint()..color = _a(color, o),
      );
    }
  }

  @override
  bool shouldRepaint(StarPainter old) => old.t != t || old.color != color;
}

class ShootingStarPainter extends CustomPainter {
  final double t;
  final double seed;
  final Color color;
  ShootingStarPainter(this.t, this.seed, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    if (t <= 0 || t >= 1) return;
    final start = Offset(size.width * (0.45 + 0.5 * seed), size.height * (0.06 + 0.2 * seed));
    const dir = Offset(-0.86, 0.5);
    final head = start + dir * (t * size.width * 0.6);
    final tail = head - dir * (110 * math.sin(math.pi * t));
    final alpha = math.sin(math.pi * t);
    canvas.drawLine(
      tail,
      head,
      Paint()
        ..color = _a(color, alpha * 0.9)
        ..strokeWidth = 2.2
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawCircle(head, 3, Paint()..color = _a(color, alpha));
  }

  @override
  bool shouldRepaint(ShootingStarPainter old) => old.t != t;
}

class ParticlePainter extends CustomPainter {
  final double t;
  final double glow;
  final Color color;
  ParticlePainter(this.t, this.glow, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    const n = 24;
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
    for (int i = 0; i < n; i++) {
      final k = i / n;
      final ang = 2 * math.pi * (k + t * (1 + (i % 3)));
      final rad = 80 + 80 * (0.5 + 0.5 * math.sin(2 * math.pi * (t * 2 + k * 3)));
      final p = c + Offset(math.cos(ang) * rad * 1.1, math.sin(ang) * rad * 0.9 - 10);
      final a = (0.25 + 0.6 * glow) * (0.5 + 0.5 * math.sin(2 * math.pi * (t * 3 + k)));
      paint.color = _a(color, a);
      canvas.drawCircle(p, 1.5 + 2.5 * glow * (i % 3 == 0 ? 1.4 : 1.0), paint);
    }
  }

  @override
  bool shouldRepaint(ParticlePainter old) => old.t != t || old.glow != glow || old.color != color;
}

// ───────────────────────── EYLEM BUTONU ─────────────────────────

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 1, end: active ? 1.25 : 1),
              duration: const Duration(milliseconds: 250),
              curve: Curves.elasticOut,
              builder: (context, v, child) => Transform.scale(scale: v, child: child),
              child: Icon(icon, size: 22, color: color),
            ),
            const SizedBox(width: 5),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

// ───────────────────────── YORUMLAR ─────────────────────────

class CommentsSheet extends StatefulWidget {
  final Lantern lantern;
  final AppData data;
  const CommentsSheet({super.key, required this.lantern, required this.data});

  @override
  State<CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<CommentsSheet> {
  final _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _send() {
    final t = _ctrl.text.trim();
    if (t.isEmpty) return;
    widget.data.addComment(widget.lantern, t);
    setState(() {});
    _ctrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final list = widget.lantern.comments;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            Text('Yorumlar (${list.length})',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Expanded(
              child: list.isEmpty
                  ? Center(child: Text('İlk yorumu sen bırak ✨', style: theme.textTheme.bodyMedium))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: list.length,
                      itemBuilder: (context, i) {
                        final c = list[i];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: _a(cs.primary, 0.08),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(c.user,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800, fontSize: 12, color: cs.primary)),
                                    const SizedBox(height: 3),
                                    Text(c.text),
                                  ],
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () => setState(() {
                                  c.liked = !c.liked;
                                  c.liked ? c.likes++ : c.likes--;
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Column(
                                    children: [
                                      Icon(c.liked ? Icons.favorite : Icons.favorite_border,
                                          size: 18, color: Colors.pinkAccent),
                                      Text('${c.likes}', style: const TextStyle(fontSize: 11)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ctrl,
                      onSubmitted: (_) => _send(),
                      decoration: InputDecoration(
                        hintText: 'Güzel bir şey yaz...',
                        filled: true,
                        fillColor: _a(cs.onSurface, 0.06),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(onPressed: _send, icon: const Icon(Icons.send_rounded)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ───────────────────────── AYARLAR PANELİ ─────────────────────────

class SettingsSheet extends StatelessWidget {
  final AppSettings settings;
  const SettingsSheet({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListenableBuilder(
      listenable: settings,
      builder: (context, _) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Görünüm', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 16),
              Text('Tema', style: theme.textTheme.labelLarge),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment(value: ThemeMode.light, icon: Icon(Icons.wb_sunny_rounded), label: Text('Açık')),
                    ButtonSegment(value: ThemeMode.dark, icon: Icon(Icons.nightlight_round), label: Text('Koyu')),
                    ButtonSegment(value: ThemeMode.system, icon: Icon(Icons.phone_android), label: Text('Sistem')),
                  ],
                  selected: {settings.mode},
                  onSelectionChanged: (s) => settings.setMode(s.first),
                ),
              ),
              const SizedBox(height: 20),
              Text('Vurgu rengi', style: theme.textTheme.labelLarge),
              const SizedBox(height: 10),
              Row(
                children: List.generate(AppSettings.accents.length, (i) {
                  final sel = settings.accentIndex == i;
                  final col = AppSettings.accents[i];
                  return GestureDetector(
                    onTap: () => settings.setAccent(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(right: 12),
                      width: sel ? 46 : 38,
                      height: sel ? 46 : 38,
                      decoration: BoxDecoration(
                        color: col,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: sel ? theme.colorScheme.onSurface : Colors.transparent, width: 3),
                        boxShadow: [
                          BoxShadow(color: _a(col, sel ? 0.7 : 0.3), blurRadius: sel ? 16 : 6),
                        ],
                      ),
                      child: sel ? const Icon(Icons.check, color: Colors.black87) : null,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Text('Yazı tipi', style: theme.textTheme.labelLarge),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(AppSettings.fonts.length, (i) {
                  final sel = settings.fontIndex == i;
                  return ChoiceChip(
                    selected: sel,
                    onSelected: (_) => settings.setFont(i),
                    label: Text(
                      AppSettings.fontLabels[i],
                      style: GoogleFonts.getFont(AppSettings.fonts[i], fontSize: 16),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Text('Yazı boyutu: %${(settings.textScale * 100).round()}',
                  style: theme.textTheme.labelLarge),
              Row(
                children: [
                  const Text('A', style: TextStyle(fontSize: 12)),
                  Expanded(
                    child: Slider(
                      value: settings.textScale,
                      min: 0.85,
                      max: 1.3,
                      divisions: 9,
                      label: '%${(settings.textScale * 100).round()}',
                      onChanged: settings.setTextScale,
                    ),
                  ),
                  const Text('A', style: TextStyle(fontSize: 22)),
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _a(theme.colorScheme.primary, 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text('Önizleme: Bu yıl denizi ilk kez görmek istiyorum.'),
              ),
              const SizedBox(height: 12),
              const Divider(),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Ateş böceği efekti'),
                subtitle: const Text('Fenerin etrafında süzülen ışıklar'),
                value: settings.particles,
                onChanged: settings.setParticles,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Titreşim geri bildirimi'),
                value: settings.haptics,
                onChanged: settings.setHaptics,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Telefon çerçevesi'),
                subtitle: const Text('Web ve masaüstünde telefon görünümü'),
                value: settings.phoneFrame,
                onChanged: settings.setPhoneFrame,
              ),
              const SizedBox(height: 4),
              Text('Fener süzülme hızı: ${settings.floatSpeed.toStringAsFixed(1)}x',
                  style: theme.textTheme.labelLarge),
              Slider(
                value: settings.floatSpeed,
                min: 0.5,
                max: 2.0,
                divisions: 6,
                label: '${settings.floatSpeed.toStringAsFixed(1)}x',
                onChanged: settings.setSpeed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ───────────────────────── YENİ DİLEK ─────────────────────────

class NewWishSheet extends StatefulWidget {
  final int nextId;
  const NewWishSheet({super.key, required this.nextId});

  @override
  State<NewWishSheet> createState() => _NewWishSheetState();
}

class _NewWishSheetState extends State<NewWishSheet> {
  final _ctrl = TextEditingController();
  static const _emojis = ['🌙', '⭐', '🌸', '🦋', '🔥', '🎈', '🍀', '💫'];
  int _emoji = 0;
  int _palette = 0;
  int _category = 0;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Yeni Dilek 🏮', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 14),
            TextField(
              controller: _ctrl,
              maxLines: 3,
              maxLength: 120,
              decoration: InputDecoration(
                hintText: 'Dileğini yaz...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 6),
            Text('Kategori', style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: List.generate(5, (i) {
                return ChoiceChip(
                  avatar: Icon(AppData.catIcons[i + 1], size: 16),
                  label: Text(AppData.cats[i + 1]),
                  selected: _category == i,
                  onSelected: (_) => setState(() => _category = i),
                );
              }),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: List.generate(_emojis.length, (i) {
                return ChoiceChip(
                  label: Text(_emojis[i], style: const TextStyle(fontSize: 20)),
                  selected: _emoji == i,
                  onSelected: (_) => setState(() => _emoji = i),
                );
              }),
            ),
            const SizedBox(height: 12),
            Row(
              children: List.generate(kPalettes.length, (i) {
                final sel = _palette == i;
                return GestureDetector(
                  onTap: () => setState(() => _palette = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 10),
                    width: sel ? 42 : 34,
                    height: sel ? 42 : 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: kPalettes[i]),
                      border: Border.all(
                          color: sel ? theme.colorScheme.onSurface : Colors.transparent, width: 3),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.local_fire_department_rounded),
                label: const Text('Feneri Uçur'),
                onPressed: () {
                  final t = _ctrl.text.trim();
                  if (t.isEmpty) return;
                  Navigator.pop(
                    context,
                    Lantern(
                      id: widget.nextId,
                      author: 'Sen',
                      emoji: _emojis[_emoji],
                      wish: t,
                      palette: _palette,
                      category: _category,
                      glow: 0.8,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}