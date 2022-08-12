import 'package:flutter/material.dart';
import 'package:piton_assignment/core/theme/theme.dart';

import 'features/auth/view/login/login_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      home: const LoginView(),
    );
  }
}
