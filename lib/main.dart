import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'modules/filter_screen/filter_screen.dart';
import 'modules/hotel/hotel_details_screen.dart';
import 'modules/hotel/hotel_main_screen.dart';
import 'modules/hotel/hotels_rooms_screen.dart';
import 'modules/test_screen.dart';
import 'modules/ِAuth/login_screen.dart';
import 'modules/user/mytrips_screen.dart';
import 'modules/welcome/onboarding_screen.dart';
import 'modules/user/porfile_screen.dart';
import 'modules/search_screen/search_screen.dart';
import 'modules/ِAuth/signup_screen.dart';
import 'modules/welcome/splash_screen.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: TestScreen(),
    );
  }
}

