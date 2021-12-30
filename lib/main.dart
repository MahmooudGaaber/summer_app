import 'package:flutter/material.dart';

import 'modules/hotel_rooms_screen/hotels_rooms_screen.dart';
import 'modules/login_screen/login_screen.dart';
import 'modules/onboarding_screen/onboarding_screen.dart';
import 'modules/profile_screen/porfile_screen.dart';
import 'modules/signup_screen/signup_screen.dart';
import 'modules/splash_screen/splash_screen.dart';

void main() {
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
      home: HotelRoomsScreen(),
    );
  }
}

