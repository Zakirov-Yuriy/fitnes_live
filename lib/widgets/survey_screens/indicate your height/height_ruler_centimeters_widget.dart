// Этот файл содержит виджет Flutter для вертикального отображения линейки роста в сантиметрах.
// Виджет является состоянием, так как он должен отслеживать текущее значение средней позиции.

import 'package:flutter/material.dart';

class HeightRulerCentimetersVertical extends StatefulWidget {
  final double height;
  final ValueChanged<double>? onChanged;

  // Конструктор виджета, принимающий высоту и обработчик изменений.
  const HeightRulerCentimetersVertical(
      {super.key, required this.height, this.onChanged});

  @override
  _HeightRulerCentimetersVerticalState createState() =>
      _HeightRulerCentimetersVerticalState();
}

class _HeightRulerCentimetersVerticalState
    extends State<HeightRulerCentimetersVertical> {
  // Переменная для отслеживания среднего значения линейки, инициализированная значением 200.
  double middleValue =
      200; // Начальное значение в середине диапазона от 200 до 140

  @override
  Widget build(BuildContext context) {
    // Виджет SingleChildScrollView используется для обеспечения прокрутки содержимого.
    return SingleChildScrollView(
      child: Column(
        children: [
          // Виджет Text отображает текущее значение средней позиции линейки в виде целого числа.
          Text(
            '${middleValue.toInt()}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
            ),
          ),
          // Внутренний контейнер содержит линейку и изображение.
          Container(
            height: 400,
            width: double.infinity,
            child: Row(
              children: [
                // Расширенный виджет содержит прослушиватель уведомлений прокрутки
                // для отслеживания изменений и обновления значения средней позиции.
                Expanded(
                  child: NotificationListener<ScrollUpdateNotification>(
                    onNotification: (notification) {
                      // Обновление среднего значения в зависимости от изменения прокрутки.
                      setState(() {
                        middleValue = (200 - (notification.metrics.pixels) / 20)
                            .clamp(132.0, 200.0);
                      });

                      // Вызов обработчика изменений, если он был предоставлен.
                      if (widget.onChanged != null) {
                        widget.onChanged!(middleValue);
                      }

                      return true;
                    },
                    // Внутренний виджет ListView.builder создает линейку и управляет ее элементами.
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 90,
                      itemBuilder: (context, index) {
                        // Рассчитывается значение текущего элемента линейки.
                        final value = 200 - index;

                        // Управление стилями и цветами в зависимости от значения.
                        Color textColor = Colors.black;
                        double fontSize = 16.0;
                        Color lineColor = Colors.black;
                        double lineWidth = 20.0;

                        if (value % 10 != 0) {
                          textColor = Colors.grey;
                          fontSize = 10.0;
                          lineColor = Colors.grey;
                          lineWidth = 10;
                        }

                        // GestureDetector обрабатывает нажатие на элемент линейки.
                        return GestureDetector(
                          onTap: () {
                            // Обновление среднего значения при выборе элемента.
                            setState(() {
                              middleValue = value.toDouble();
                            });

                            // Вызов обработчика изменений, если он был предоставлен.
                            if (widget.onChanged != null) {
                              widget.onChanged!(value.toDouble());
                            }

                            // Дополнительный вызов обработчика изменений, если он был предоставлен.
                            widget.onChanged?.call(value.toDouble());
                          },
                          // Вложенный виджет Row содержит цифру и линию для каждого элемента линейки.
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                // Виджет Text отображает текущее значение элемента линейки.
                                child: Text(
                                  '$value',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: fontSize,
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: lineWidth,
                                color: lineColor,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Вложенный виджет Column содержит дополнительные элементы интерфейса.
                Column(
                  children: [
                    const SizedBox(height: 10),
                    // Дополнительный контейнер с двумя виджетами, представляющими декоративные элементы.
                    Container(
                      width: 140,
                      height: 2,
                      color: const Color.fromRGBO(255, 51, 119, 1),
                    ),
                  ],
                ),
                // Вложенный виджет Image.asset отображает изображение девушки.
                Image.asset(
                  'assets/images/survey_screens_image/girl-over.png',
                  height: 420,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
