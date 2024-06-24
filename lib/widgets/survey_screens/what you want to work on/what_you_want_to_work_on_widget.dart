import 'package:flutter/material.dart';

class YourParentWidget extends StatelessWidget {
  const YourParentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Пример использования WhatYouWantToWorkOnWidget с передачей параметров
              WhatYouWantToWorkOnWidget(
                labelText: 'Руки',
                // Параметры для первой кнопки "Руки"
                startPoint: const Offset(0, 0), // Начальная точка первой линии
                endPoint: const Offset(0, 0), // Конечная точка первой линии
                ballRadius: 0.0, // Радиус шарика на конце первой линии
                secondLineEnd:
                    const Offset(0, 0), // Конечная точка второй линии
                secondBallRadius: 0.0, // Радиус шарика на конце второй линии
                onSelected: (isSelected) {
                  // Обработка события выбора
                  print('Руки выбраны: $isSelected');
                },
              ),
              const SizedBox(height: 20),
              WhatYouWantToWorkOnWidget(
                labelText: 'Грудь',
                // Параметры для второй кнопки "Грудь"
                startPoint:
                    const Offset(50, 50), // Начальная точка первой линии
                endPoint: const Offset(150, 150), // Конечная точка первой линии
                ballRadius: 15.0, // Радиус шарика на конце первой линии
                secondLineEnd:
                    const Offset(200, 200), // Конечная точка второй линии
                secondBallRadius: 8.0, // Радиус шарика на конце второй линии
                onSelected: (isSelected) {
                  // Обработка события выбора
                  print('Грудь выбрана: $isSelected');
                },
              ),
              // Добавьте другие экземпляры WhatYouWantToWorkOnWidget по необходимости
            ],
          ),
        ),
      ),
    );
  }
}

class WhatYouWantToWorkOnWidget extends StatefulWidget {
  final String labelText;
  final ValueChanged<bool>? onSelected;
  final Color iconColor;
  final Offset startPoint;
  final Offset endPoint;
  final double ballRadius;
  final Offset secondLineEnd; // Конечная точка второй линии
  final double secondBallRadius; // Радиус шарика на конце второй линии

  const WhatYouWantToWorkOnWidget({
    Key? key,
    required this.labelText,
    this.onSelected,
    this.iconColor = Colors.black,
    required this.startPoint, // Начальная точка первой линии
    required this.endPoint, // Конечная точка первой линии
    required this.ballRadius, // Радиус шарика на конце первой линии
    required this.secondLineEnd, // Конечная точка второй линии
    required this.secondBallRadius, // Радиус шарика на конце второй линии
  }) : super(key: key);

  @override
  _WhatYouWantToWorkOnWidgetState createState() =>
      _WhatYouWantToWorkOnWidgetState();
}

class _WhatYouWantToWorkOnWidgetState extends State<WhatYouWantToWorkOnWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    // Создаем экземпляр LinePainter для текущей кнопки
    LinePainter linePainter = LinePainter(
      isSelected: isSelected,
      startPoint: widget.startPoint, // Используем параметр startPoint
      endPoint: widget.endPoint, // Используем параметр endPoint
      ballRadius: widget.ballRadius, // Используем параметр ballRadius
      secondLineEnd: widget.secondLineEnd, // Используем параметр secondLineEnd
      secondBallRadius:
          widget.secondBallRadius, // Используем параметр secondBallRadius
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.onSelected?.call(isSelected);
        });
      },
      child: CustomPaint(
        painter: linePainter,
        child: Container(
          height: 65,
          width: 157,
          padding: const EdgeInsets.all(7),
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
              // const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.labelText,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: widget.iconColor,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              // const SizedBox(width: 5),
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
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final bool isSelected;
  final Offset startPoint;
  final Offset endPoint;
  final double ballRadius;
  final Offset secondLineEnd;
  final double secondBallRadius;

  LinePainter({
    required this.isSelected,
    required this.startPoint,
    required this.endPoint,
    required this.ballRadius,
    required this.secondLineEnd,
    required this.secondBallRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (isSelected) {
      final Paint paint = Paint()
        ..color = const Color.fromRGBO(255, 51, 119, 1)
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 2.0;

      // Добавляем первую линию
      canvas.drawLine(startPoint, endPoint, paint);

      // Добавляем вторую линию
      final Offset secondLineStart = endPoint;
      canvas.drawLine(secondLineStart, secondLineEnd, paint);

      // Рисуем шарик на конце второй линии
      final Paint ballPaint = Paint()
        ..color = const Color.fromRGBO(255, 51, 119, 1);
      canvas.drawCircle(secondLineEnd, secondBallRadius, ballPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
