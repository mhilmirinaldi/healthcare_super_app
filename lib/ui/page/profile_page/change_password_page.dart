import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/extension/build_context_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final currentPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passToggle3 = true;
  bool passToggle = true;
  bool passToggle2 = true;

  @override
  void dispose() {
    currentPasswordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    'Change Password',
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
                        controller: currentPasswordController,
                        obscureText: passToggle3 ? true : false,
                        decoration: InputDecoration(
                          labelText: 'Current Password',
                          labelStyle: const TextStyle(color: textColor),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor)),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () {
                              passToggle3 = !passToggle3;
                              setState(() {});
                            },
                            child: Icon(
                              passToggle3
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        )),
                    verticalSpaces(25),
                    TextField(
                        controller: passwordController,
                        obscureText: passToggle ? true : false,
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          labelStyle: const TextStyle(color: textColor),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor)),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () {
                              passToggle = !passToggle;
                              setState(() {});
                            },
                            child: Icon(
                              passToggle
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        )),
                    verticalSpaces(25),
                    TextField(
                        controller: confirmPasswordController,
                        obscureText: passToggle2 ? true : false,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(color: textColor),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor)),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () {
                              passToggle2 = !passToggle2;
                              setState(() {});
                            },
                            child: Icon(
                              passToggle2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
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
                                  if (passwordController.text.isEmpty) {
                                    context.showSnackBar(
                                        'New Password cannot be empty');
                                    return;
                                  }
                                  if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    context.showSnackBar(
                                        'Password does not match');
                                    return;
                                  }

                                  ref
                                      .read(userDataProvider.notifier)
                                      .changePassword(
                                          currentPassword:
                                              currentPasswordController.text,
                                          newPassword: passwordController.text);

                                  
                                },
                                child: const Text(
                                  'Change Password',
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
