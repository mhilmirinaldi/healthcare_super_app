import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/page/profile_page/profile_item.dart';
import 'package:super_app_telemedicine/ui/page/profile_page/user_info.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              verticalSpaces(20),
              ...userInfo(ref),
              verticalSpaces(20),
              const Divider(),
              verticalSpaces(20),
              profileItem('Update Profile'),
              verticalSpaces(20),
              profileItem('Change Password'),
              verticalSpaces(60),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFE1004E)),
                  ),
                  onPressed: () {
                    ref.read(userDataProvider.notifier).logout();
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              verticalSpaces(20),
              const Text('Version 1.0.0', style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
