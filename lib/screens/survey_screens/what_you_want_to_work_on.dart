import 'package:flutter/material.dart';

import '../../widgets/survey_screens/button/next_button.dart';
import '../../widgets/survey_screens/what you want to work on/what_you_want_to_work_on_widget.dart';
import 'we_can_cope_screen.dart';

class WhatYouWantToWorkOn extends StatefulWidget {
  @override
  _WhatYouWantToWorkOnState createState() => _WhatYouWantToWorkOnState();
}

class _WhatYouWantToWorkOnState extends State<WhatYouWantToWorkOn> {
  int completedAnswers = 0; // Счетчик завершенных ответов
  final String _labelTitle = 'Что хотите \nпроработать?'; // Заголовок экрана

  List<bool> isSelectedList = List.generate(
      6, (index) => false); // Список флагов выбора для различных частей тела
  bool isButtonEnabled = false; // Флаг для активации/деактивации кнопки

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Цель'), // Заголовок верхней панели
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _labelTitle,
              style: const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ), // Заголовок экрана

            const SizedBox(height: 20.0),

            Row(
              children: [
                Image.asset(
                  'assets/images/survey_screens_image/girl-with.png',
                  width: 222,
                  height: 490,
                ), // Изображение силуэта человека

                Expanded(
                  child: Column(
                    children: [
                      // Виджет для выбора "Руки"
                      WhatYouWantToWorkOnWidget(
                        labelText: 'Руки',
                        onSelected: (isSelected) =>
                            updateButtonState(isSelected, 0),
                        startPoint: const Offset(0, 30),
                        endPoint: const Offset(-100, 30),
                        ballRadius: 0.0,
                        secondLineEnd: const Offset(-110, 85),
                        secondBallRadius: 5.0,
                      ),
                      const SizedBox(height: 20.0),

                      // Виджет для выбора "Грудь"
                      WhatYouWantToWorkOnWidget(
                        labelText: 'Грудь',
                        onSelected: (isSelected) =>
                            updateButtonState(isSelected, 1),
                        startPoint: const Offset(30, 30),
                        endPoint: const Offset(-60, 50),
                        ballRadius: 0.0,
                        secondLineEnd: const Offset(-150, 30),
                        secondBallRadius: 5.0,
                      ),
                      const SizedBox(height: 20.0),

                      // Виджет для выбора "Живот"
                      WhatYouWantToWorkOnWidget(
                        labelText: 'Живот',
                        onSelected: (isSelected) =>
                            updateButtonState(isSelected, 2),
                        startPoint: const Offset(10, 10),
                        endPoint: const Offset(-20, 20),
                        ballRadius: 5.0,
                        secondLineEnd: const Offset(-145, -10),
                        secondBallRadius: 5.0,
                      ),
                      const SizedBox(height: 20.0),

                      // Виджет для выбора "Ягодицы"
                      WhatYouWantToWorkOnWidget(
                        labelText: 'Ягодицы',
                        onSelected: (isSelected) =>
                            updateButtonState(isSelected, 3),
                        startPoint: const Offset(40, 30),
                        endPoint: const Offset(-20, 20),
                        ballRadius: 5.0,
                        secondLineEnd: const Offset(-105, -70),
                        secondBallRadius: 5.0,
                      ),
                      const SizedBox(height: 20.0),

                      // Виджет для выбора "Икры"
                      WhatYouWantToWorkOnWidget(
                        labelText: 'Икры',
                        onSelected: (isSelected) =>
                            updateButtonState(isSelected, 4),
                        startPoint: const Offset(10, 30),
                        endPoint: const Offset(-50, -22),
                        ballRadius: 5.0,
                        secondLineEnd: const Offset(-150, 10),
                        secondBallRadius: 5.0,
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10.0),
            NextCustomButtonWidget(
                buttonText: 'СЛЕДУЮЩЕЕ',
                destinationWidget: WeCanCope(),
                completedAnswers: completedAnswers,
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WeCanCope()),
                        );
                        setState(() {
                          completedAnswers++;
                        });
                      }
                    : null),
          ],
        ),
      ),
    );
  }

  void updateButtonState(bool isSelected, int index) {
    setState(() {
      isSelectedList[index] = isSelected;

      // Если выбран "Все тело", активируются все части тела
      if (index == 5 && isSelected) {
        for (int i = 0; i < isSelectedList.length - 1; i++) {
          isSelectedList[i] = true;
        }
      }

      // Проверка, есть ли хотя бы один выбранный элемент
      isButtonEnabled = isSelectedList.any((isSelected) => isSelected);
    });
  }
}
