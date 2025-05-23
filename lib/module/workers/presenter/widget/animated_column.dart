import 'package:flutter/material.dart';

class AnimatedColumn extends StatefulWidget {
  final List<Widget> children;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  const AnimatedColumn({
    super.key,
    required this.children,
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(milliseconds: 100),
    this.curve = Curves.easeOut,
  });

  @override
  State<AnimatedColumn> createState() => _AnimatedColumnState();
}

class _AnimatedColumnState extends State<AnimatedColumn> with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _offsetAnimations;
  late final List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();
    final animCount = widget.children.length - 1;

    _controllers = List.generate(animCount, (i) {
      return AnimationController(
        duration: widget.duration,
        vsync: this,
      );
    });

    _offsetAnimations = _controllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, 0.2),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: widget.curve));
    }).toList();

    _fadeAnimations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(parent: controller, curve: widget.curve));
    }).toList();

    _runAnimations();
  }

  Future<void> _runAnimations() async {
    for (int i = 0; i < _controllers.length; i++) {
      await Future.delayed(widget.delay);
      _controllers[i].forward();
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.children.isEmpty) return const SizedBox();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.children[0], // первый — без анимации
        for (int i = 1; i < widget.children.length; i++)
          SlideTransition(
            position: _offsetAnimations[i - 1],
            child: FadeTransition(
              opacity: _fadeAnimations[i - 1],
              child: widget.children[i],
            ),
          ),
      ],
    );
  }
}
