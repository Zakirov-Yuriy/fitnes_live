import 'package:flutter/material.dart';
import '../../../../widgets/app_screens/workout_screen/training_screen/Container_Carousel_Six/Face Exercises/face_exercises_widget.dart';

class FaceExercisesWorkoutScreen extends StatefulWidget {
  @override
  _FaceExercisesWorkoutScreenState createState() =>
      _FaceExercisesWorkoutScreenState();
}

class _FaceExercisesWorkoutScreenState
    extends State<FaceExercisesWorkoutScreen> {
  ScrollController _scrollController = ScrollController();
  bool _isImageVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isImageVisible = _scrollController.offset <= 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: _isImageVisible
                ? null
                : const Text(
                    'Face Exercises',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/training_image/workout_image/Face exercises/Face Exercises.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              // color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FaceExercisesWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
