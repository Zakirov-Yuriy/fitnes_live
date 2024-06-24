import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'provider/birth_year_provider.dart';
import 'provider/height_provider.dart';
import 'provider/weight_provider.dart';
import 'widgets/survey_screens/splash_screen/splash_screen.dart';

///////
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HeightProvider()),
        ChangeNotifierProvider(create: (context) => WeightProvider()),
        ChangeNotifierProvider(create: (context) => BirthYearProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
