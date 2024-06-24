//Загрущочный экран
// Загружаем необходимые библиотеки
import 'dart:async';
import 'package:flutter/material.dart';

import '../../../screens/survey_screens/next_anna_screen.dart';

class SplashImageScreen extends StatefulWidget {
  const SplashImageScreen({Key? key}) : super(key: key);

  @override
  _SplashImageScreenState createState() => _SplashImageScreenState();
}

class _SplashImageScreenState extends State<SplashImageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween(begin: 1.0, end: 1.2).animate(_controller);

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      // Используйте _navigatorKey для доступа к контексту навигатора
      _navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (context) => NextScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: Image.asset(
                  'assets/images/survey_screens_image/bg.jpeg',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Positioned(
            bottom: 230.0,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Column(
                children: [
                  Text(
                    'Workout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48.0,
                    ),
                  ),
                  Text(
                    'for women',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 51, 119, 1),
                      fontSize: 48.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
