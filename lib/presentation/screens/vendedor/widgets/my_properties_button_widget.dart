import 'package:alquiler_app/presentation/screens/vendedor/my_properties_list_screen.dart';
import 'package:flutter/material.dart';


class MyPropertiesButtonWidget extends StatelessWidget {
  const MyPropertiesButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyPropertiesListScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          'Mis Propiedades',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}