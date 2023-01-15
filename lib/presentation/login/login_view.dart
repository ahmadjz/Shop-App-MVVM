import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/data/network/app_api.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          AppServiceClient appServiceClient = AppServiceClient();
          final x =
              await appServiceClient.login("AhmadJzz99@gmail.com", "ahmad123");
          print(x.toString());
        },
      ),
    );
  }
}
