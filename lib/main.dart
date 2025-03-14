import 'package:anxiety_app/firebase_options.dart';
import 'package:anxiety_app/view/log_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

 

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(), 
    );
  }
} 