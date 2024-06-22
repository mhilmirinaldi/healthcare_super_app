import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/location_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

Widget userInfo(WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image:
                      ref.watch(userDataProvider).valueOrNull?.photoUrl != null
                          ? NetworkImage(ref
                              .watch(userDataProvider)
                              .valueOrNull!
                              .photoUrl!) as ImageProvider
                          : const AssetImage('assets/default_profile2.png'),
                  fit: BoxFit.cover)),
        ),
        horizontalSpaces(10),
        Text(
          (ref.watch(userDataProvider).valueOrNull?.name ?? '')
              .split(' ')
              .take(2)
              .join(' '),
          style: const TextStyle(color: Colors.black),
        ),
        const Spacer(),
        Text(
          ref.watch(locationProvider),
          style: const TextStyle(color: Colors.black),
        ),
        horizontalSpaces(3),
        const Icon(
          Icons.location_on,
          color: primaryColor,
        )
      ],
    ),
  );
}
