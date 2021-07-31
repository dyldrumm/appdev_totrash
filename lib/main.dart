import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:camera/camera.dart';
import 'package:totrash/helpers/appRoutes.dart';
import 'package:totrash/screens/CameraScreen.dart';
import 'package:totrash/screens/DataScreen.dart';
import 'package:totrash/screens/HomeScreen.dart';
import 'dart:ui';

// void main() {
//   runApp(MyApp());
// }

List<CameraDescription> cameras = [];
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    // Retrieve the device cameras
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print("\n\nCamera Exception error:");
    print(e);
    print("\n\n");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToTrash Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      initialRoute: Approutes.homescreen,
      routes: {
        Approutes.homescreen: (context) => HomeScreen(),
        Approutes.datascreen: (context) => DataScreen(),
      },
    );
  }
}

// **Previous implementation of main, goes directly to camera screen**

// Global variable for storing the list of
// cameras available
// List<CameraDescription> cameras = [];

// Future<void> main() async {
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     // Retrieve the device cameras
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     print(e);
//   }
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'To Trash',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CameraScreen(),
//     );
//   }
// }