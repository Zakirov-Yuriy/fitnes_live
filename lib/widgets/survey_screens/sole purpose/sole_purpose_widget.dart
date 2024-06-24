/*
  Этот файл содержит виджет для отображения элемента выбора цели в приложении.
  Виджет представляет собой контейнер с изображением и описанием цели.
  При выборе цели виджет меняет стиль и отображает дополнительную информацию.
*/

// Импорт необходимых библиотек и кастомных иконок
import 'package:flutter/material.dart';

import '../../../costom_icons.dart';

// Виджет для отображения элемента выбора цели
class SolePurposeWidget extends StatefulWidget {
  final String labelText;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final String additionalText;
  final String additionalSubText;
  final Color iconColor;
  final Color textColor;
  final IconData? customIcon; // Добавлен параметр для кастомной иконки

  const SolePurposeWidget({
    Key? key,
    required this.labelText,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    this.additionalText = '',
    this.iconColor = Colors.amber,
    this.textColor = Colors.black,
    this.customIcon,
    required this.additionalSubText,
    // Добавлен параметр
  }) : super(key: key);

  @override
  _SolePurposeWidgetState createState() => _SolePurposeWidgetState();
}

class _SolePurposeWidgetState extends State<SolePurposeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: widget.isSelected ? 2 : 2,
                color: widget.isSelected
                    ? const Color.fromRGBO(255, 51, 119, 1)
                    : const Color.fromARGB(255, 210, 210, 210),
              ),
              color: widget.isSelected
                  ? const Color.fromRGBO(255, 225, 234, 1)
                  : Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.labelText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: widget.isSelected ? Colors.black : Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (widget.isSelected)
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(241, 244, 247, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (widget.customIcon == null)
                    Icon(
                      CostomIcons.muscle_wd7nyxe8dhrx,
                      color: widget.iconColor,
                      size: 50,
                    )
                  else
                    Icon(
                      widget.customIcon,
                      color: widget.iconColor,
                      size: 50,
                    ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.additionalText,
                            style: TextStyle(
                              fontSize: 16,
                              color: widget.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.additionalSubText,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
