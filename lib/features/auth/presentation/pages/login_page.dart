import 'package:auto_route/auto_route.dart';
import 'package:eski_su/custom/custom_app_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(),
      ),
    );
  }
}
