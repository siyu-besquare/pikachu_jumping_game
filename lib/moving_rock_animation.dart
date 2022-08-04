import 'package:flutter/material.dart';

class MovingRock extends StatefulWidget {
  const MovingRock({Key? key}) : super(key: key);

  @override
  State<MovingRock> createState() => _MovingRockState();
}

class _MovingRockState extends State<MovingRock>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Image.asset("assets/stone.png"),
    );
  }
}
