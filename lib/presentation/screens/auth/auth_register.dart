import 'package:alquiler_app/presentation/screens/home_page/home_page.dart';
import 'package:alquiler_app/presentation/screens/registro/lessor_lessee_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class AuthRegister extends StatelessWidget {
  const AuthRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];

    if (FirebaseAuth.instance.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    void onSignedIn() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
    }

    return RegisterScreen(
      providers: providers,
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          onSignedIn();
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LessorLesseeScreen()),
            (route) => false,
          );
        }),
      ],
    );
  }
}
