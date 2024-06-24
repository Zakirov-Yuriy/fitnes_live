/*
  Этот файл представляет собой экран "Цель" в приложении.
  Здесь задается вопрос, отображаются варианты ответов, и пользователь может выбрать ответ.
  После выбора ответа он может перейти к следующему вопросу.
*/

// Импорт необходимых библиотек и виджетов
import 'package:flutter/material.dart';

import '../../widgets/survey_screens/button/next_button.dart';
import '../../widgets/survey_screens/question answer/question_answer_widget.dart';
import 'sole_purpose_screen.dart';

// Основной виджет для экрана "Цель"
class GoalScreen extends StatefulWidget {
  @override
  _GoalScreenState createState() => _GoalScreenState();
}

// Состояние виджета "Цель"
class _GoalScreenState extends State<GoalScreen> {
  int completedAnswers = 0; // Счетчик выбранных ответов
  final String _labelTitle =
      'Что мотивирует вас больше всего?'; // Заголовок вопроса

  bool isButtonEnabled = false; // Флаг активации кнопки "СЛЕДУЮЩЕЕ"

  // Основной метод для построения виджета
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Виджет "Оболочка" для создания базовой структуры экрана
      appBar: AppBar(
        title: const Text('Цель'), // Заголовок экрана
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        // Виджет "Контейнер" для создания отступов и управления внешним видом
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _labelTitle,
              style: const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            // Виджет для вопроса с вариантами ответов
            QuestionAnswerWidget(
              iconData: Icons.thumb_up_outlined,
              labelText: 'Чувствовать себя уверенно',
              onSelected: (isSelected) => updateButtonState(isSelected),
            ),
            const SizedBox(height: 20.0),
            QuestionAnswerWidget(
              iconData: Icons.sentiment_satisfied_alt_outlined,
              labelText: 'Снять стресс',
              onSelected: (isSelected) => updateButtonState(isSelected),
            ),
            const SizedBox(height: 20.0),
            QuestionAnswerWidget(
              iconData: Icons.favorite_border_outlined,
              labelText: 'Улучшить здоровье',
              onSelected: (isSelected) => updateButtonState(isSelected),
            ),
            const SizedBox(height: 20.0),
            QuestionAnswerWidget(
              iconData: Icons.electric_bolt_outlined,
              labelText: 'Зарядится энергий',
              onSelected: (isSelected) => updateButtonState(isSelected),
            ),
            const SizedBox(height: 20.0),
            QuestionAnswerWidget(
              iconData: Icons.self_improvement_outlined,
              labelText: 'Набрать форму',
              onSelected: (isSelected) => updateButtonState(isSelected),
            ),
            const SizedBox(height: 10.0),
            // Виджет "Поднятая кнопка" для перехода к следующему вопросу

            NextCustomButtonWidget(
                buttonText: 'СЛЕДУЮЩЕЕ',
                destinationWidget: SolePurpose(),
                completedAnswers: completedAnswers,
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SolePurpose()),
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

  // Метод для обновления состояния кнопки "СЛЕДУЮЩЕЕ"
  void updateButtonState(bool isSelected) {
    setState(() {
      isButtonEnabled = isSelected;
    });
  }
}
