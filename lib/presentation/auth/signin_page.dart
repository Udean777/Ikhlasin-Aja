import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikhlas_kan/core/assets/app_assets.dart';
import 'package:ikhlas_kan/core/theme/app_colors.dart';
import 'package:ikhlas_kan/core/widgets/custom_elevated_button.dart';
import 'package:ikhlas_kan/core/widgets/custom_textfield.dart';
import 'package:ikhlas_kan/presentation/auth/signup_page.dart';
import 'package:ikhlas_kan/presentation/main/home/pages/home_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _welcomeText = Text(
    "Welcome Back!",
    style: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  );

  final _subtitleText = Text(
    "Please sign in to continue.",
    style: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
    ),
    textAlign: TextAlign.center,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _HeaderImage(),
                      _welcomeText,
                      _subtitleText,
                      _buildFormFields(),
                      CustomElevatedButton(
                        text: "Login",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                      ),
                      _RegisterLink(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextfield(
          controller: emailController,
          hintText: "Email",
          prefixIcon: const Icon(Icons.email),
          isPassword: false,
        ),
        CustomTextfield(
          controller: passwordController,
          hintText: "Password",
          prefixIcon: const Icon(Icons.password),
          isPassword: true,
        ),
      ],
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.mainImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _RegisterLink extends StatelessWidget {
  const _RegisterLink();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Doesn't have an account? ",
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.black54,
        ),
        children: [
          TextSpan(
            text: "Register",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(AppColors.color1),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ),
                );
              },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
