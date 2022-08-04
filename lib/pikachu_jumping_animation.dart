import 'package:flutter/material.dart';

class jumpingAnimation extends StatefulWidget {
  const jumpingAnimation({Key? key}) : super(key: key);

  @override
  State<jumpingAnimation> createState() => _jumpingAnimationState();
}

class _jumpingAnimationState extends State<jumpingAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, -1.5),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat(reverse: true);
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (_, Widget? child) {
          return SlideTransition(
              position: _offsetAnimation,
              child: Column(
                children: [
                  Image.asset("assets/jump.png"),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    child: Image.asset('stay.png'),
                  ),
                ],
              ));
        });
  }
}
