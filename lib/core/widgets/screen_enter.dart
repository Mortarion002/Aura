import 'package:flutter/material.dart';

class ScreenEnter extends StatefulWidget {
  final Widget child;

  const ScreenEnter({super.key, required this.child});

  @override
  State<ScreenEnter> createState() => _ScreenEnterState();
}

class _ScreenEnterState extends State<ScreenEnter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    final curved = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _fade = curved;
    _slide = Tween<Offset>(
      begin: const Offset(0.045, 0),
      end: Offset.zero,
    ).animate(curved);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}
