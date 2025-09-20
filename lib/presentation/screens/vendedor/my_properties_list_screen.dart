import 'package:alquiler_app/presentation/screens/cliente/property_detail_screen.dart';
import 'package:alquiler_app/presentation/screens/cliente/widgets/payment_info_widget.dart';
import 'package:alquiler_app/presentation/screens/cliente/widgets/property_image_carousel_widget.dart';
import 'package:alquiler_app/presentation/screens/vendedor/publish_property_screen.dart';
import 'package:alquiler_app/presentation/screens/vendedor/widgets/buyer_info_widget.dart';
import 'package:alquiler_app/presentation/screens/vendedor/widgets/property_status_chip_widget.dart';
import 'package:flutter/material.dart';

class MyPropertiesListScreen extends StatelessWidget {
  const MyPropertiesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis propiedades', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Propiedad 1: Vendida
              _buildPropertyItem(
                context,
                propertyTitle: 'Casa familiar en Condesa',
                imageUrls: ['assets/images/property_4.jpg'], // Una imagen por ahora
                buyerName: 'Alicia Lopez',
                modality: 'Venta',
                time: '3 años',
                balance: '\$10,000',
                isCurrent: true,
                status: 'Vendido',
              ),
              const SizedBox(height: 20),

              // Propiedad 2: Publicado
              _buildPropertyItem(
                context,
                propertyTitle: 'Departamento en Polanco',
                imageUrls: ['assets/images/property_2.jpg'], // Otra imagen
                buyerName: 'Sin comprador', // Ejemplo para estado publicado
                modality: 'Renta',
                time: '6 meses',
                balance: '\$0',
                isCurrent: true,
                status: 'Publicado',
              ),
              const SizedBox(height: 20),

              // Propiedad 3: En Revisión (ejemplo)
               _buildPropertyItem(
                context,
                propertyTitle: 'Terreno en la Roma',
                imageUrls: ['assets/images/property_3.jpg'], // Otra imagen
                buyerName: 'Pendiente',
                modality: 'Venta',
                time: 'N/A',
                balance: '\$0',
                isCurrent: true,
                status: 'Revisión',
              ),
              const SizedBox(height: 30),

              // Botón "Publicar nuevo"
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PublishPropertyScreen(),
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
                  child: const Text('Publicar nuevo', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyItem(
    BuildContext context, {
    required String propertyTitle,
    required List<String> imageUrls,
    required String buyerName,
    required String modality,
    required String time,
    required String balance,
    required bool isCurrent,
    required String status,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.zero, // Eliminar margen extra si el padre ya tiene padding
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: PropertyStatusChipWidget(status: status),
            ),
            const SizedBox(height: 10), // Espacio entre chip y imagen
            // Usamos PropertyImageCarouselWidget para mostrar la imagen (solo la primera por simplicidad)
            PropertyImageCarouselWidget(imageUrls: [imageUrls.first]),
            const SizedBox(height: 10),

            BuyerInfoWidget(buyerName: buyerName),
            const SizedBox(height: 10),

            PaymentInfoWidget(
              modality: modality,
              time: time,
              balance: balance,
              isCurrent: isCurrent,
            ),
            
            if (status != 'Vendido' && status != 'Rentado') // Mostrar "Ver detalle" si no está vendido/rentado
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PropertyDetailScreen(propertyTitle: propertyTitle),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Ver detalle'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}