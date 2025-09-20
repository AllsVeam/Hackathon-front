import 'package:alquiler_app/presentation/screens/home/widgets/account_card_widget.dart';
import 'package:flutter/material.dart';


class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ahora el cuerpo de la pantalla contendrá tu widget
      body: const AccountCardWidget(),
    );
  }
}