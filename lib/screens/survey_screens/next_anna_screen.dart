import 'package:flutter/material.dart';

import '../../widgets/survey_screens/button/start_anna_button.dart';
import 'question_answer_screen.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/survey_screens_image/anna_photo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                const Text(
                  'Привет, я Анна!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 21.0, color: Colors.black),
                    children: [
                      TextSpan(
                        text:
                            'Я ваш личный тренер.\nУ меня есть пара вопросов к вам, они помогут составить ',
                      ),
                      TextSpan(
                        text: 'персональный план',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 51, 119, 1),
                        ),
                      ),
                      TextSpan(
                        text: ' для вас.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          StartAnnaCustomButtonWidget(
            buttonText: 'НАЧАТЬ',
            destinationWidget: GoalScreen(),
          ),
        ],
      ),
    );
  }
}
