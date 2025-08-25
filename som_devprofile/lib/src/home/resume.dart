import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../html_open_link.dart';
import 'data.dart';

class Resume extends StatefulWidget {
  const Resume({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> with SingleTickerProviderStateMixin {
  final String data = resume();

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Drives all funky outline animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (data == '') {
      return const SizedBox.shrink();
    }

    final color = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: EdgeInsets.only(
          right: widget.width * 0.019,
          left: widget.width * 0.019,
          top: widget.width * 0.019),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            // Draw funky animated lines around the content
            painter: _FunkyOutlinePainter(
              progress: _controller.value,
              color: color,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => htmlOpenLink(data),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.description_outlined,
                        color: color.withValues(alpha: 0.95),
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Download Resume',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.download_outlined,
                        color: color.withOpacity(0.8),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Painter for funky animated outlines: rotating arcs, dashed border, and orbiting dots.
class _FunkyOutlinePainter extends CustomPainter {
  _FunkyOutlinePainter({
    required this.progress,
    required this.color,
  });

  final double progress; // 0..1
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    // Layout
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(
      rect.inflate(14), // leave space for the drawings
      const Radius.circular(16),
    );

    // Base subtle outline
    final baseOutline = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.5
      ..color = color.withOpacity(0.25);
    canvas.drawRRect(rrect, baseOutline);

    // Dashed border that animates around the rrect
    _drawAnimatedDashedBorder(canvas, rrect,
        color: color.withOpacity(0.85), progress: progress);

    // Rotating arcs (concentric) around the content
    _drawRotatingArcs(canvas, rect, color: color, progress: progress);

    // Orbiting dots for a lively effect
    _drawOrbitingDots(canvas, rect, baseColor: color, progress: progress);
  }

  void _drawAnimatedDashedBorder(Canvas canvas, RRect rrect,
      {required Color color, required double progress}) {
    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics().first;
    final total = metrics.length;

    const dash = 18.0; // dash length
    const gap = 12.0; // gap length
    final shift = (dash + gap) * progress; // move along path

    final paintDash = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0
      ..color = color;

    for (double start = -shift; start < total; start += dash + gap) {
      final s = start.clamp(0.0, total);
      final e = (start + dash).clamp(0.0, total);
      if (e > s) {
        final seg = metrics.extractPath(s, e);
        canvas.drawPath(seg, paintDash);
      }
    }
  }

  void _drawRotatingArcs(Canvas canvas, Rect rect,
      {required Color color, required double progress}) {
    final center = rect.center;
    final minSide = math.min(rect.width, rect.height);

    // Choose radii slightly beyond the content area
    final radii = <double>[
      minSide * 0.55,
      minSide * 0.7,
      minSide * 0.85,
    ];

    for (int i = 0; i < radii.length; i++) {
      final radius = radii[i];
      final startAngle = 2 * math.pi * (progress + i * 0.2);
      final sweep = math.pi / 3 + i * 0.15; // different arc sizes

      final paintArc = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2 + i.toDouble()
        ..strokeCap = StrokeCap.round
        ..color = color.withOpacity(0.65 - i * 0.15);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweep,
        false,
        paintArc,
      );

      // draw a mirrored arc on the opposite side for balance
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + math.pi,
        sweep * 0.8,
        false,
        paintArc
          ..color = paintArc.color.withOpacity(paintArc.color.opacity * 0.8),
      );
    }
  }

  void _drawOrbitingDots(Canvas canvas, Rect rect,
      {required Color baseColor, required double progress}) {
    final center = rect.center;
    final minSide = math.min(rect.width, rect.height);

    final radii = [minSide * 0.62, minSide * 0.77, minSide * 0.92];
    final speeds = [1.0, 1.6, 2.2];
    final sizes = [3.5, 3.0, 2.5];

    for (int i = 0; i < radii.length; i++) {
      final angle = 2 * math.pi * ((progress * speeds[i]) % 1.0) + i * 0.9;
      final offset =
          Offset(math.cos(angle), math.sin(angle)) * radii[i] + center;

      // Soft glow effect by drawing circles with decreasing opacity
      final glowPaint = Paint()..color = baseColor.withOpacity(0.18);
      canvas.drawCircle(offset, sizes[i] * 2.2, glowPaint);
      canvas.drawCircle(offset, sizes[i] * 1.5,
          glowPaint..color = baseColor.withOpacity(0.12));

      final dotPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = baseColor.withOpacity(0.95);
      canvas.drawCircle(offset, sizes[i], dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _FunkyOutlinePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
