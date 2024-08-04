import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/extension/build_context_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passToggle = true;

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
                          passToggle ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // check if email null
                      if (emailController.text.isEmpty) {
                        context.showSnackBar('Email cannot be empty');
                        return;
                      }
                      ref
                          .read(userDataProvider.notifier)
                          .resetPassword(email: emailController.text);
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                verticalSpaces(10),
                switch (ref.watch(userDataProvider)) {
                  AsyncData(:final value) => value == null
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  const Color(0xFFE1004E)),
                            ),
                            onPressed: () {
                              ref.read(userDataProvider.notifier).login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        ref.read(routerProvider).goNamed('register');
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
