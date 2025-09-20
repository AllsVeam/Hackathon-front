import 'package:alquiler_app/presentation/screens/cliente/widgets/property_cost_widget.dart';
import 'package:alquiler_app/presentation/screens/cliente/widgets/property_description_widget.dart';
import 'package:alquiler_app/presentation/screens/cliente/widgets/property_image_carousel_widget.dart';
import 'package:alquiler_app/presentation/screens/cliente/widgets/property_location_widget.dart';
import 'package:flutter/material.dart';


class PropertyDetailScreen extends StatelessWidget {
  final String propertyTitle; // Puedes pasar el título de la propiedad

  const PropertyDetailScreen({
    super.key,
    required this.propertyTitle,
  });

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo para la propiedad
    final List<String> imageUrls = [
      'assets/images/property_1.jpg', // Asegúrate de tener estas imágenes
      //'assets/images/house_detail_2.png',
      //'assets/images/house_detail_3.png',
    ];
    const String description =
        'A paragraph of text with an unassigned link. A second line of text with a web link. An icon inline with text.';
    const String address = 'Av. Jardines Tepeyac 17';
    const String totalCost = '\$20,000';
    const String downPayment = '\$40,000';

    return Scaffold(
      appBar: AppBar(
        title: Text(propertyTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la propiedad (como "CASA EN VENTA")
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                propertyTitle,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            
            // Carrusel de imágenes
            PropertyImageCarouselWidget(imageUrls: imageUrls),
            const SizedBox(height: 20),

            // Descripción
            const PropertyDescriptionWidget(description: description),
            const SizedBox(height: 20),

            // Ubicación
            const PropertyLocationWidget(address: address),
            const SizedBox(height: 20),

            // Costo y enganche
            const PropertyCostWidget(
              totalCost: totalCost,
              downPayment: downPayment,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}