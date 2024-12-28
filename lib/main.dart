import 'package:flutter/material.dart';
import 'package:ikhlas_kan/core/theme/app_colors.dart';
import 'package:ikhlas_kan/presentation/auth/signin_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ikhlasin",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: onSecondary,
          error: error,
          onError: onError,
          surface: surface,
          onSurface: onSurface,
        ),
      ),
      home: SigninPage(),
    );
  }
}
