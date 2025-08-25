import 'package:flutter/material.dart';

class AnimatedSection extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final AnimationType animationType;

  const AnimatedSection({
    Key? key,
    required this.child,
    this.delay = const Duration(milliseconds: 200),
    this.animationType = AnimationType.fadeInUp,
  }) : super(key: key);

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Start animation after delay
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() => _isVisible = true);
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      return const SizedBox.shrink();
    }

    switch (widget.animationType) {
      case AnimationType.fadeIn:
        return FadeTransition(
          opacity: _fadeAnimation,
          child: widget.child,
        );
      case AnimationType.fadeInUp:
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: widget.child,
          ),
        );
      case AnimationType.scaleIn:
        return ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: widget.child,
          ),
        );
      case AnimationType.typewriter:
        return TypewriterAnimation(
          child: widget.child,
          controller: _controller,
        );
    }
  }
}

class TypewriterAnimation extends StatefulWidget {
  final Widget child;
  final AnimationController controller;

  const TypewriterAnimation({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  State<TypewriterAnimation> createState() => _TypewriterAnimationState();
}

class _TypewriterAnimationState extends State<TypewriterAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return Opacity(
          opacity: widget.controller.value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - widget.controller.value)),
            child: widget.child,
          ),
        );
      },
    );
  }
}

enum AnimationType {
  fadeIn,
  fadeInUp,
  scaleIn,
  typewriter,
}

class VisibilityDetector extends StatefulWidget {
  final Widget child;
  final Function(bool isVisible) onVisibilityChanged;

  const VisibilityDetector({
    Key? key,
    required this.child,
    required this.onVisibilityChanged,
  }) : super(key: key);

  @override
  State<VisibilityDetector> createState() => _VisibilityDetectorState();
}

class _VisibilityDetectorState extends State<VisibilityDetector> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        final screenHeight = MediaQuery.of(context).size.height;
        
        final isVisible = position.dy < screenHeight && position.dy > -renderBox.size.height;
        widget.onVisibilityChanged(isVisible);
        
        return false;
      },
      child: widget.child,
    );
  }
}