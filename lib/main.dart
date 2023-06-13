import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth_page.dart';

// If running into firebase errors, you may have to write into terminal:
// Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const OverclockApp());
}

class OverclockApp extends StatelessWidget {
  const OverclockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Overclock_App',
      theme: ThemeData.dark(),
      home: const AuthPage(),
    );
  }
}
