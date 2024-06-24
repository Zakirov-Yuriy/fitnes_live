import 'package:fitnes_live/provider/birth_year_provider.dart';
import 'package:fitnes_live/screens/survey_screens/indicate_your_height_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import '../../widgets/survey_screens/button/next_button.dart';

class EnterYourBirthday extends StatefulWidget {
  @override
  _EnterYourBirthdayState createState() => _EnterYourBirthdayState();
}

class _EnterYourBirthdayState extends State<EnterYourBirthday> {
  int completedAnswers = 0;
  final String _labelTitle = 'Укажите свой год рождения';
  bool isButtonEnabled = false;
  bool isBackgroundChanged = false;
  int selectedYear = DateTime.now().year - 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Цель'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            _labelTitle,
            style: const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          _buildContainerWithText(),
          const SizedBox(height: 40.0),
          _buildYearPicker(),
          const SizedBox(height: 50.0),
          NextCustomButtonWidget(
            buttonText: 'СЛЕДУЮЩЕЕ',
            destinationWidget: IndicateYourHeightScreen(),
            completedAnswers: completedAnswers,
            onPressed: isButtonEnabled ? _handleNextButtonPress : null,
          ),
        ],
      ),
    );
  }

  Widget _buildContainerWithText() {
    return Container(
      margin: const EdgeInsets.only(right: 6, left: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: isBackgroundChanged
            ? const Color.fromRGBO(255, 51, 119, 1)
            : const Color.fromARGB(255, 234, 233, 233),
      ),
      child: Center(
        child: Text(
          'Это поможет нам скорректировать ваш персональный план.',
          style: TextStyle(
            fontSize: 16.0,
            color: isBackgroundChanged ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildYearPicker() {
    return Container(
      height: 360,
      child: CupertinoPicker(
        itemExtent: 60.0,
        scrollController: FixedExtentScrollController(
          initialItem: DateTime.now().year - 1959,
        ),
        onSelectedItemChanged: _handleYearPickerChange,
        children: List.generate(
          DateTime.now().year - 1931 + 1,
          (index) => Center(
            child: Text(
              '${1932 + index}',
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }

  void _handleYearPickerChange(int index) {
    setState(() {
      selectedYear = 1932 + index;
      updateButtonState(true);
      if (!isBackgroundChanged) {
        isBackgroundChanged = true;
      }
    });
  }

  void _handleNextButtonPress() {
    Provider.of<BirthYearProvider>(context, listen: false).birthYear =
        selectedYear;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IndicateYourHeightScreen(),
      ),
    );
    setState(() {
      completedAnswers++;
    });
  }

  void updateButtonState(bool isSelected) {
    setState(() {
      isButtonEnabled = isSelected;
      if (isSelected) {
        context.read<BirthYearProvider>().birthYear = selectedYear;
      }
    });
  }
}
