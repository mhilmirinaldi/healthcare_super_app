import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/extension/build_context_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool passToggle = true;
  bool passToggle2 = true;

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (next is AsyncData) {
        if (next.value != null) {
          ref.read(routerProvider).goNamed('main');
        }
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              verticalSpaces(40),
              Center(
                child: Image.asset('assets/logo_login.png'),
              ),
              verticalSpaces(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: textColor),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor)),
                          prefixIcon: Icon(Icons.person),
                        )),
                    verticalSpaces(20),
                    TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: textColor),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor)),
                          prefixIcon: Icon(Icons.email),
                        )),
                    verticalSpaces(20),
                    TextField(
                        controller: passwordController,
                        obscureText: passToggle ? true : false,
                        decoration: InputDecoration(
                          labelText: 'Password',
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
                    verticalSpaces(20),
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
                    verticalSpaces(20),
                    switch (ref.watch(userDataProvider)) {
                      AsyncData(:final value) => value == null
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (passwordController.text ==
                                      confirmPasswordController.text) {
                                    ref
                                        .read(userDataProvider.notifier)
                                        .register(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text);
                                  } else {
                                    context.showSnackBar(
                                        'Password does not match');
                                  }
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator()),
                      _ => const Center(child: CircularProgressIndicator()),
                    },
                    verticalSpaces(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            ref.read(routerProvider).goNamed('login');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
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
