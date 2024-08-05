import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/extension/build_context_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

class UpdateProfilePage extends ConsumerStatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  ConsumerState<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends ConsumerState<UpdateProfilePage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    emailController.text = ref.watch(userDataProvider).valueOrNull?.email ?? '';
    nameController.text = ref.watch(userDataProvider).valueOrNull?.name ?? '';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
            ),
          ),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => ref.read(routerProvider).pop(),
              ),
            ),
            elevation: 2,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Update Profile',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              verticalSpaces(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: textColor, fontSize: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor)),
                          prefixIcon: Icon(Icons.person),
                          // init value from provider
                        )),
                    verticalSpaces(25),
                    TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: textColor, fontSize: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor)),
                          prefixIcon: Icon(Icons.email),
                        )),
                    verticalSpaces(30),
                    switch (ref.watch(userDataProvider)) {
                      AsyncData(:final value) => value != null
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color(0xFFE1004E)),
                                ),
                                onPressed: () {
                                  if (nameController.text.isEmpty) {
                                    context.showSnackBar('Name cannot be empty');
                                    return;
                                  }
                                  if (emailController.text.isEmpty) {
                                    context.showSnackBar('Email cannot be empty');
                                    return;
                                  }
                                  //check format email
                                  if (!emailController.text.contains('@') || !emailController.text.contains('.')) {
                                    context.showSnackBar('Email is not valid');
                                    return;
                                  }
                                  ref.read(userDataProvider.notifier).updateProfile(
                                        email: emailController.text,
                                        name: nameController.text,
                                      );

                                  context.showSnackBar('Profile updated');
                                },
                                child: const Text(
                                  'Update Profile',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator()),
                      _ => const Center(child: CircularProgressIndicator()),
                    },
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
