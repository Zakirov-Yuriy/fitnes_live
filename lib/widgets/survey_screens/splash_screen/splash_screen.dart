import 'package:flutter/material.dart';

// Импортируйте shared_preferences
import 'package:shared_preferences/shared_preferences.dart';

import '../../../screens/app_screens/main_screen.dart';
import '../../../screens/survey_screens/next_anna_screen.dart';
import 'splash_image_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.forward();

    // После завершения анимации проверяем выполненность опросника и переходим на соответствующий экран
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        // Здесь проверяем выполненность опросника
        bool isSurveyCompleted = await checkSurveyCompletion();
        if (isSurveyCompleted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        } else {
          Future.delayed(const Duration(milliseconds: 300), () {
            // Добавляем небольшую задержку перед переходом на следующий экран
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NextScreen(),
              ),
            );
          });
        }
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
    return const SplashImageScreen();
  }

  // Функция для проверки выполненности опросника
  Future<bool> checkSurveyCompletion() async {
    // Здесь вставьте код для проверки выполненности опросника
    // Например, используйте shared_preferences или другой механизм для сохранения состояния опросника
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isCompleted = prefs.getBool('survey_completed') ?? false;
    return isCompleted;
  }
}
