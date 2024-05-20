import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/extension/build_context_extension.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';
import 'package:super_app_telemedicine/ui/widget/text_field.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        children: [
          CustomTextField(
            labelText: 'Email',
            controller: emailController,
          ),
          ElevatedButton(
              onPressed: () {
                ref
                    .read(userDataProvider.notifier)
                    .login(email: 'admin@gmail.com', password: '123456');
              },
              child: const Text('Login')),
        ],
      ),
    );
  }
}
