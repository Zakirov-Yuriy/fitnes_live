import 'package:flutter/material.dart';

import '../../widgets/survey_screens/button/start_button.dart';
import '../app_screens/main_screen.dart';

class MesmerizingFigure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/survey_screens_image/girl-measuring.png'),
            fit: BoxFit.cover, // чтобы изображение покрывало весь контейнер
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Заголовок и текст
            const SizedBox(height: 550),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: 'Завораживающая \nФигура ',
                        ),
                        TextSpan(
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent,
                            height:
                                1.5, // Установите значение height по вашему усмотрению
                          ),
                          text: '\nза 8-10 минут в день',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            StartCustomButtonWidget(
              buttonText: 'НАЧАТЬ',
              destinationWidget: const MainScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
