import 'dart:math' as math;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fortpolio/utils/utils.dart';

import 'landing_page.dart';

/// HeroPage
/// - Displays an "About" section with lorem ipsum
/// - Animated diagonal line graphics moving across the screen (Walkman-like vibe)
/// - Navigates to LandingPage when user scrolls mouse/trackpad or swipes left
class HeroPage extends StatefulWidget {
  const HeroPage({super.key});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // Wheel throttling to avoid multiple rapid navigations
  DateTime _lastWheelNav = DateTime.fromMillisecondsSinceEpoch(0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToLanding() {
    // Slide transition into the Landing page
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const LandingPage(),
        transitionsBuilder: (_, animation, __, child) {
          final offsetTween = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeOutCubic));
          return SlideTransition(
            position: animation.drive(offsetTween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 420),
      ),
    );
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is! PointerScrollEvent) return;

    const throttle = Duration(milliseconds: 350);
    if (DateTime.now().difference(_lastWheelNav) < throttle) return;

    // Choose dominant axis similar to WalkmanAlbum
    final dy = event.scrollDelta.dy;
    final dx = event.scrollDelta.dx;
    final primary = (dy.abs() >= dx.abs()) ? dy : dx;
    if (primary == 0) return;

    // Navigate when scrolling left or up (natural gesture to move forward)
    if (primary < 0) {
      _lastWheelNav = DateTime.now();
      _navigateToLanding();
    }
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    // Strong left swipe navigates
    if ((details.primaryVelocity ?? 0) < -300) {
      _navigateToLanding();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        //display app logo in a small box
        title: const Text(
          'About- Som Home ',
          style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Listener(
        onPointerSignal: _onPointerSignal,
        child: GestureDetector(
          onHorizontalDragEnd: _onHorizontalDragEnd,
          behavior: HitTestBehavior.opaque,
          child: Stack(
            children: [
              // Background gradient similar to Landing backdrop
              const _Backdrop(),

              // Animated diagonal lines canvas
              RepaintBoundary(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return CustomPaint(
                      painter: _LinesPainter(
                        t: _controller.value,
                        primary: colors.primary,
                        secondary: colors.secondary,
                      ),
                      size: Size.infinite,
                    );
                  },
                ),
              ),

              // Content
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            appLogoCircle,
                            SizedBox(width: 12),
                            const Text(
                              'Som ❤️ Home — A Digital Journey ',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'The Gallery contains Artworks in form of Paintings and Applications developed over the years..',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Each piece reflects a unique aspect of creativity and technical skill, showcasing a blend of visual artistry and functional design',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'You are free to use my work for inspiration and reference , Download them or use it for your own creative break... All my works are under Creative Commons.',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Do Try it out! \n Any help you gain or fun you have is my Prize! :-)',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Hint footer
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Opacity(
                    opacity: 0.7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Text(
                        'Scroll Left or Mouse Wheel to enter Gallery',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Backdrop extends StatelessWidget {
  const _Backdrop();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.2),
          radius: 1.0,
          colors: [Color(0xFF111317), Color(0xFF0C0D10)],
        ),
      ),
    );
  }
}

class _LinesPainter extends CustomPainter {
  final double t; // 0..1 from AnimationController
  final Color primary;
  final Color secondary;

  _LinesPainter({
    required this.t,
    required this.primary,
    required this.secondary,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    // Draw multiple diagonal lines with slight parallax speeds
    const int lineCount = 18;
    final rnd = math.Random(1337);

    for (int i = 0; i < lineCount; i++) {
      // Deterministic per-line params
      final seed = rnd.nextDouble();
      final y = (i + 1) / (lineCount + 1) * height; // distribute vertically
      final thickness = 1.0 + (seed * 3.0);
      final speed = 0.2 + seed * 1.2; // relative speed
      final hueMix = seed < 0.5 ? primary : secondary;
      final color = hueMix.withOpacity(0.12 + seed * 0.25);

      // Horizontal displacement based on time, wrap around width
      final total =
          width + height; // travel distance including diagonal overscan
      final phase = seed * total;
      final shift = (t * total * speed + phase) % total;

      // Diagonal from left-bottom to right-top, overscan edges to avoid pop-in
      final start = Offset(-height + shift, height + shift);
      final end = Offset(width + shift, -shift);

      final paint = Paint()
        ..color = color
        ..strokeWidth = thickness
        ..style = PaintingStyle.stroke
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _LinesPainter oldDelegate) {
    return oldDelegate.t != t ||
        oldDelegate.primary != primary ||
        oldDelegate.secondary != secondary;
  }
}
