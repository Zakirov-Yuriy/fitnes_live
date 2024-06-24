// height_ruler_pounds_widget.dart
import 'package:flutter/material.dart';

class HeightRulerPounds extends StatefulWidget {
  final double weightInPounds;
  final ValueChanged<double>? onChanged;

  const HeightRulerPounds(
      {super.key, required this.weightInPounds, this.onChanged});

  @override
  _HeightRulerPoundsState createState() => _HeightRulerPoundsState();
}

class _HeightRulerPoundsState extends State<HeightRulerPounds> {
  double middleValue =
      70; // Начальное значение в середине диапазона от 66 до 264

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 300,
          child: Column(
            children: [
              Text(
                '${middleValue.toInt()}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: NotificationListener<ScrollUpdateNotification>(
                  onNotification: (notification) {
                    // Рассчитываем значение в середине видимой части списка
                    setState(() {
                      middleValue =
                          (66 + (notification.metrics.pixels + 140) / 30)
                              .clamp(66.0, 264.0);
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(middleValue);
                    }
                    return true;
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 198, // Изменено количество элементов
                    itemBuilder: (context, index) {
                      final value = 66 + index;

                      Color textColor = Colors.black;
                      double fontSize = 16.0;
                      Color lineColor = Colors.black;
                      double lineWidth = 20.0;

                      if (value % 22 != 0) {
                        textColor = Colors.grey;
                        fontSize = 10.0;
                        lineColor = Colors.grey;
                        lineWidth = 10;
                      }

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            middleValue = value.toDouble();
                          });

                          if (widget.onChanged != null) {
                            widget.onChanged!(value.toDouble());
                          }
                          widget.onChanged?.call(value.toDouble());
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 30,
                              height: 20,
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              child: Text(
                                '$value',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: fontSize,
                                ),
                              ),
                            ),
                            Container(
                              height: lineWidth,
                              width: 1,
                              color: lineColor,
                            ),
                            const SizedBox(height: 20), // Добавлен отступ
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          top: 35,
          left: 149,
          right: 149,
          child: Container(
            width: 2,
            height: 74,
            color: const Color.fromRGBO(255, 51, 119, 1),
          ),
        ),
      ],
    );
  }
}
