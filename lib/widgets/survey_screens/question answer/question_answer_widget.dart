/*
  Этот файл содержит виджет для отображения вопроса с вариантами ответа.
  Виджет реагирует на касание, позволяя пользователю выбирать варианты ответа.
*/

// Импорт необходимых библиотек
import 'package:flutter/material.dart';

// Виджет для вопроса с вариантами ответа
class QuestionAnswerWidget extends StatefulWidget {
  final IconData iconData; // Иконка для отображения варианта ответа
  final String labelText; // Текст варианта ответа
  final ValueChanged<bool>? onSelected; // Callback-функция для обработки выбора
  final Color iconColor;

  // Конструктор с параметрами
  const QuestionAnswerWidget({
    Key? key,
    required this.iconData,
    required this.labelText,
    this.onSelected,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  _QuestionAnswerWidgetState createState() => _QuestionAnswerWidgetState();
}

// Состояние виджета вопроса с вариантами ответа
class _QuestionAnswerWidgetState extends State<QuestionAnswerWidget> {
  bool isSelected = false; // Флаг выбора ответа

  // Метод для построения виджета
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Переключение флага выбора при касании
          widget.onSelected
              ?.call(isSelected); // Вызов callback-функции при выборе
        });
      },
      child: Container(
        height: 87,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: isSelected ? 2 : 2,
            color: isSelected
                ? const Color.fromRGBO(255, 51, 119, 1)
                : Colors.grey,
          ),
          color: isSelected
              ? const Color.fromRGBO(255, 225, 234, 1)
              : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40, // Фиксированная ширина контейнера для иконки
              child: Icon(
                widget.iconData,
                size: 30.0,
                color: widget.iconColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.labelText,
                style: TextStyle(
                  fontSize: 16.0,
                  color: widget.iconColor,
                ),
              ),
            ),
            const SizedBox(width: 40),
            Icon(
              isSelected
                  ? Icons.check_circle_outlined
                  : Icons.radio_button_unchecked,
              color: isSelected ? widget.iconColor : Colors.grey,
              size: 27,
            ),
          ],
        ),
      ),
    );
  }
}
