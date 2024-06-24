/*
  Этот файл представляет собой экран "Цель" в приложении.
  Здесь пользователь выбирает главную цель и переходит к следующему этапу.
*/

// Импорт необходимых библиотек и виджетов
import 'package:flutter/material.dart';

import '../../costom_icons.dart';
import '../../widgets/survey_screens/sole purpose/sole_purpose_widget.dart';
import 'smart_exercise_screen.dart';

// Виджет для экрана выбора главной цели
class SolePurpose extends StatefulWidget {
  @override
  _SolePurposeState createState() => _SolePurposeState();
}

// Состояние виджета выбора главной цели
class _SolePurposeState extends State<SolePurpose> {
  int completedAnswers = 0; // Счетчик выбранных целей
  final String _labelTitle = 'Какая у вас главная \nцель?'; // Заголовок экрана

  int openedWidgetIndex = -1; // Индекс открытого виджета цели

  // Метод для обновления индекса открытого виджета
  void updateOpenedWidgetIndex(int index) {
    setState(() {
      openedWidgetIndex = openedWidgetIndex == index ? -1 : index;
    });
  }

  // Метод для построения виджета
  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        openedWidgetIndex != -1; // Флаг активации кнопки "Следующее"

    return Scaffold(
      appBar: AppBar(
        title: const Text('Цель'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                _labelTitle,
                style:
                    const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              SolePurposeWidget(
                labelText: 'Сбросить вес',
                imagePath: 'assets/images/survey_screens_image/snap1.png',
                isSelected: openedWidgetIndex == 0,
                onTap: () => updateOpenedWidgetIndex(0),
                additionalText: 'Вы сможете достичь своих целей!',
                additionalSubText: 'Путь к здоровому и активному образу жизни!',
                customIcon: CostomIcons.sports_4fzqtvt977t1,
              ),
              const SizedBox(height: 10.0),
              SolePurposeWidget(
                labelText: 'Нарастить мышечную массу',
                imagePath: 'assets/images/survey_screens_image/snap2.png',
                isSelected: openedWidgetIndex == 1,
                onTap: () => updateOpenedWidgetIndex(1),
                additionalText: 'Пришло время стать сильнее!',
                additionalSubText:
                    'Ваш тренер поможет активировать каждую мышцу!',
              ),
              const SizedBox(height: 10.0),
              SolePurposeWidget(
                labelText: 'Быть в форме',
                imagePath: 'assets/images/survey_screens_image/snap3.png',
                isSelected: openedWidgetIndex == 2,
                onTap: () => updateOpenedWidgetIndex(2),
                additionalText: 'Путеводитель по здоровому образу жизни!',
                additionalSubText:
                    'Добро пожаловать в мир здоровья и активности!',
                customIcon: CostomIcons.success_ifcteb55zwwt,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: ElevatedButton(
          onPressed: isButtonEnabled
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SmartExercise()),
                  );
                  setState(() {
                    completedAnswers++;
                  });
                }
              : null,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: isButtonEnabled
                ? const Color.fromRGBO(255, 51, 119, 1)
                : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'СЛЕДУЮЩЕЕ',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
