/*
  Этот файл представляет экран WeCanCope, который приветствует пользователя от имени тренера (Анны) и содержит кнопку для перехода к основному экрану с вопросами о целях пользователя.
*/

// Импорт необходимых библиотек
import 'package:flutter/material.dart';

import '../../widgets/survey_screens/button/start_button.dart';
import 'enter_your_birthday_screen.dart';

// Класс для создания WeCanCope
class WeCanCope extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Заголовок и текст
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Мы сможем справиться!', // Текст приветствия
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                    children: [
                      TextSpan(
                          text:
                              '83.5% наших пользователей сообщили о замечательных достижениях уже после первой недели.'),
                    ],
                  ),
                ),
                // Фотография (занимает половину экрана)
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/survey_screens_image/removebg-preview.png'), //  Фотография
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset('assets/images/survey_screens_image/calendar.png'),
              ],
            ),
          ),
          StartCustomButtonWidget(
            buttonText: 'НАЧАТЬ',
            destinationWidget: EnterYourBirthday(),
          ),
        ],
      ),
    );
  }
}
