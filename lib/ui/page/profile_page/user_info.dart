import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

List<Widget> userInfo(WidgetRef ref) => [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 1),
          image: DecorationImage(
              image: ref.watch(userDataProvider).valueOrNull?.photoUrl != null
                  ? NetworkImage(
                          ref.watch(userDataProvider).valueOrNull!.photoUrl!)
                      as ImageProvider
                  : const AssetImage('assets/default_profile2.png'),
              fit: BoxFit.cover),
        ),
      ),
      verticalSpaces(20),
      Text(
        ref.watch(userDataProvider).valueOrNull?.name ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      Text(
        ref.watch(userDataProvider).valueOrNull?.email ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12),
      ),
    ];
