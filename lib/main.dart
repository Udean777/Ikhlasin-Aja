import 'package:flutter/material.dart';
import 'package:ikhlas_kan/presentation/auth/signin_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ikhlasin",
      debugShowCheckedModeBanner: false,
      home: SigninPage(),
    );
  }
}
