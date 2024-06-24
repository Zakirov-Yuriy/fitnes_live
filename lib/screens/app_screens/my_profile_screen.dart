import 'package:fitnes_live/provider/height_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../provider/birth_year_provider.dart';
import '../../provider/weight_provider.dart';

class MyProfileScreen extends StatefulWidget {
  final int? height;

  MyProfileScreen({this.height});

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  // Измени объявление переменной weight
  int weight = 0; // Используй значение по умолчанию, которое нужно

  String formattedWeight() {
    return weight.toString();
  }

  String? avatarUrl;
  // int weight = 70;
  String gender = 'Мужской';
  // int birthYear = 1990;
  String userName = 'Пользователь'; // Имя пользователя
  List<bool> isSelected = [true, false]; // Изначально первая кнопка выбрана
  @override
  @override
  Widget build(BuildContext context) {
    // Используйте провайдер для получения данных о росте и единицах измерения
    int heightValue = Provider.of<HeightProvider>(context).heightValue;
    HeightUnit heightUnit = Provider.of<HeightProvider>(context).heightUnit;
    // Вместо использования переменной birthYear, получите значение из провайдера
    int birthYear = Provider.of<BirthYearProvider>(context).birthYear;
// Вместо использования напрямую значения weight, получите его из провайдера
    weight = Provider.of<WeightProvider>(context).weight.round();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой профиль'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Аватарка
            // buildAvatar(),

            const SizedBox(height: 20),

            // Текст "Пользователь"
            buildUserNameText(),
            const SizedBox(height: 20),

            const SizedBox(height: 20),
            // Строка с ростом
            buildProfileRow('Рост',
                '$heightValue ${heightUnit == HeightUnit.centimeters ? 'см' : 'ft'}'),

            // Строка с весом
            buildProfileRow('Вес', '${formattedWeight()} кг'),
            const SizedBox(height: 20),
            // Строка с полом
            buildGenderRow(),
            const SizedBox(height: 20),
            // Строка с годом рождения
            buildProfileRow('Год рождения', '$birthYear'),

            // Дополнительный контент
          ],
        ),
      ),
    );
  }

  Widget buildToggleButton(String label, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
        color: isSelected[index]
            ? const Color.fromRGBO(255, 51, 119, 1)
            : const Color.fromARGB(255, 230, 228, 228),
      ),
      width: 150,
      height: 35,
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: isSelected[index] ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  void handleToggleButtons(int index) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < isSelected.length;
          buttonIndex++) {
        isSelected[buttonIndex] = buttonIndex == index;
      }

      // Обновляем единицы измерения в провайдерах
      Provider.of<HeightProvider>(context, listen: false).toggleHeightUnit();
    });
  }

  // Widget buildAvatar() {
  //   return GestureDetector(
  //     onTap: () {
  //       _showImageSourceDialog();
  //     },
  //     child: Center(
  //       child: CircleAvatar(
  //         radius: 50,
  //         backgroundImage: avatarUrl != null
  //             ? NetworkImage(avatarUrl!)
  //             : const AssetImage('assets/images/avatar.jpg') as ImageProvider,
  //         child: avatarUrl == null
  //             ? IconButton(
  //                 icon: Icon(
  //                   Icons.add_a_photo,
  //                   color: Colors.grey.withOpacity(0.0),
  //                 ),
  //                 onPressed: () {
  //                   _showImageSourceDialog();
  //                 },
  //               )
  //             : null,
  //       ),
  //     ),
  //   );
  // }

  // В методе buildUserNameText() добавьте иконку карандаша
  Widget buildUserNameText() {
    return GestureDetector(
      onTap: () {
        _showNameInputDialog();
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.mode_edit_outlined, // Иконка карандаша
              size: 23,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showNameInputDialog() async {
    String? newName = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String tempName = userName;

        return AlertDialog(
          title: const Text('Введите имя и фамилию'),
          content: TextField(
            onChanged: (value) {
              tempName = value;
            },
            decoration: const InputDecoration(hintText: 'Имя и фамилия'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Закрыть диалог без сохранения
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(tempName); // Сохранить введенное имя
              },
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );

    // Обновить имя пользователя при необходимости
    if (newName != null && newName.isNotEmpty && newName != userName) {
      setState(() {
        userName = newName;
      });
    }
  }

  Future<void> _showImageSourceDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Выберите источник изображения'),
          actions: <Widget>[
            TextButton(
              child: const Text('Галерея'),
              onPressed: () {
                _getImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Камера'),
              onPressed: () {
                _getImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          avatarUrl = pickedFile.path;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Widget buildProfileRow(String label, String value) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildGenderRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Пол',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  gender = 'Мужской';
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: gender == 'Мужской'
                    ? Colors.white
                    : Colors.black, // Цвет текста
                backgroundColor: gender == 'Мужской'
                    ? Colors.pink
                    : Colors.white, // Цвет кнопки
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 50,
                ), // Поля вокруг текста
              ),
              child: const Text(
                'М',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(width: 15), // Увеличьте расстояние между кнопками
            ElevatedButton(
              onPressed: () {
                setState(() {
                  gender = 'Женский';
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: gender == 'Женский'
                    ? Colors.white
                    : Colors.black, // Цвет текста
                backgroundColor: gender == 'Женский'
                    ? Colors.pink
                    : Colors.white, // Цвет кнопки
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 50,
                ), // Поля вокруг текста
              ),
              child: const Text(
                'Ж',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),

        // Row(
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {
        //         setState(() {
        //           gender = 'Мужской';
        //         });
        //       },
        //       style: ElevatedButton.styleFrom(
        //         foregroundColor: Colors.white,
        //         backgroundColor: Colors.pink, // Цвет текста
        //         padding: const EdgeInsets.symmetric(
        //             vertical: 8, horizontal: 50), // Поля вокруг текста
        //       ),
        //       child: const Text(
        //         'М',
        //         style: TextStyle(fontSize: 18),
        //       ),
        //     ),
        //     const SizedBox(width: 15), // Увеличьте расстояние между кнопками
        //     ElevatedButton(
        //       onPressed: () {
        //         setState(() {
        //           gender = 'Женский';
        //         });
        //       },
        //       style: ElevatedButton.styleFrom(
        //         foregroundColor: Colors.white,
        //         backgroundColor: Colors.pink, // Цвет текста
        //         padding: const EdgeInsets.symmetric(
        //             vertical: 8, horizontal: 50), // Поля вокруг текста
        //       ),
        //       child: const Text(
        //         'Ж',
        //         style: TextStyle(fontSize: 18),
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(height: 20),
      ],
    );
  }
}
