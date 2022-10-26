import 'package:face_to_face_messager_app/view/pages/onboarding/onboarding_page.dart';
import 'package:face_to_face_messager_app/view/pages/register/faceId/face_id_main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  //Connection with Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: onBoardingPage(),
      home: FaceIdMainPage(),
    );
  }
}