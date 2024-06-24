import 'package:flutter/material.dart';

class StartCustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final Widget destinationWidget;

  const StartCustomButtonWidget({
    super.key,
    required this.buttonText,
    required this.destinationWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0, left: 16, right: 16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => destinationWidget,
                ),
              );
              // Добавьте код здесь для обработки нажатия кнопки
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color.fromRGBO(255, 51, 119, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
