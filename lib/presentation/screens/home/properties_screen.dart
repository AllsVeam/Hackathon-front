import 'package:alquiler_app/presentation/screens/home/widgets/property_card_widget.dart';
import 'package:alquiler_app/presentation/screens/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Renta/Compra',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Mandamos a llamar al widget de la barra de búsqueda
            const SearchBarWidget(),

            // Cuadrícula de propiedades
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                // Mandamos a llamar al widget de la tarjeta de propiedad con datos
                const PropertyCardWidget(
                  price: '\$1,200,000',
                  imagePath: 'assets/images/property_1.jpg',
                ),
                const PropertyCardWidget(
                  price: '\$1,200,000',
                  imagePath: 'assets/images/property_2.jpg',
                ),
                const PropertyCardWidget(
                  price: '\$1,200,000',
                  imagePath: 'assets/images/property_3.jpg',
                ),
                const PropertyCardWidget(
                  price: '\$1,200,000',
                  imagePath: 'assets/images/property_4.jpg',
                ),
              ],
            ),

            const SizedBox(height: 20),

            const MyPropertiesButtonWidget(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
