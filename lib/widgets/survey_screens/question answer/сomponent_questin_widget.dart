// Файл ComponentWidget представляет собой простой виджет, отображающий иконку.

// Импорт необходимых библиотек
import 'package:flutter/material.dart';

// Класс для создания компонента (виджета) с иконкой
class ComponentWidget extends StatelessWidget {
  // Конструктор, принимающий ключ и иконку для отображения
  const ComponentWidget({Key? key, required this.iconData}) : super(key: key);

  // Поле для хранения иконки
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    // Возвращаем виджет иконки с заданной иконкой
    return Icon(
      iconData,
    );
  }
}
