/*
Файл SmartExercise отвечает за экран, который представляет собой приветствие от   тренера (Анны)
 и содержит кнопку для перехода к основному экрану с вопросами о целях пользователя.
 */

// Импорт необходимых библиотек
import 'package:flutter/material.dart';
import '../../widgets/survey_screens/button/start_button.dart';
import 'what_you_want_to_work_on.dart';

// Класс для создания SmartExercise
class SmartExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Фотография (занимает половину экрана)
          Container(
            margin: EdgeInsets.only(top: 40),
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/survey_screens_image/poza.png'), //  Фотография
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Заголовок и текст
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                const Text(
                  'Умные упражнения!', // Текст приветствия
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 26.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 21.0, color: Colors.black),
                    children: [
                      TextSpan(
                        text:
                            'Ключ к эффективному фитнесу. Для достижения оптимальных результатов необходимо грамотно сочетать физические упражнения с процессом восстановления.',
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 50),
              ],
            ),
          ),
          StartCustomButtonWidget(
            buttonText: 'НАЧАТЬ',
            destinationWidget: WhatYouWantToWorkOn(),
          ),
        ],
      ),
    );
  }
}
