
import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/domain/entity/user.dart';

class MainPage extends StatelessWidget {
  final User user;

  const MainPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Text(user.toString()),
      ),
    );
  }
}
