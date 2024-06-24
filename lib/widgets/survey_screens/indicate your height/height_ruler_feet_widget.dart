import 'package:flutter/material.dart';

class HeightRulerFeetVertical extends StatefulWidget {
  final double height;
  final ValueChanged<double>? onChanged;

  const HeightRulerFeetVertical(
      {super.key, required this.height, this.onChanged});

  @override
  _HeightRulerFeetVerticalState createState() =>
      _HeightRulerFeetVerticalState();
}

class _HeightRulerFeetVerticalState extends State<HeightRulerFeetVertical> {
  double middleValue =
      7; // Начальное значение в середине диапазона от 7 до 0 футов

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            '${middleValue.toStringAsFixed(1)}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: NotificationListener<ScrollUpdateNotification>(
                    onNotification: (notification) {
                      setState(() {
                        middleValue = (7 - (notification.metrics.pixels) / 200)
                            .clamp(0.0, 7.0);
                      });

                      if (widget.onChanged != null) {
                        widget.onChanged!(middleValue);
                      }
                      return true;
                    },
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 70,
                      itemBuilder: (context, index) {
                        final value = (7 - index * 0.1).clamp(0.0, 7.0);

                        Color textColor = Colors.black;
                        double fontSize = 16.0;
                        Color lineColor = Colors.black;
                        double lineWidth = 20.0;

                        if (index % 10 != 0) {
                          textColor = Colors.grey;
                          fontSize = 10.0;
                          lineColor = Colors.grey;
                          lineWidth = 10;
                        }

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              middleValue = value;
                            });

                            if (widget.onChanged != null) {
                              widget.onChanged!(value);
                            }
                            widget.onChanged?.call(value);
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                child: Text(
                                  '${value.toStringAsFixed(1)}',
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
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 140,
                      height: 2,
                      color: const Color.fromRGBO(255, 51, 119, 1),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/girl-over.png',
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
