import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/domain/usecase/login/login.dart';
import 'package:super_app_telemedicine/ui/page/main_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/login_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Login login = ref.watch(loginProvider);

              login(LoginParams(email: "admin@gmail.com", password: '123456'))
                  .then((result){
                    if (result.isSuccess){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MainPage(user: result.resultValue!),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(result.errorMessage!),
                      ));
                    }
                  });
            },
            child: Text("Login"),
          ),
        ));
  }
}
