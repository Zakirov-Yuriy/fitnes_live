import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../screens/survey_screens/question_answer_screen.dart';

class StartAnnaCustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final Widget destinationWidget;

  const StartAnnaCustomButtonWidget({
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
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('survey_completed', true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => GoalScreen(),
                ),
              );
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
