import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text('Hello Hilmi!'),
        ),
      ),
    );
  }
}
