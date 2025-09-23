import 'package:alquiler_app/presentation/screens/cliente/widgets/payment_info_widget.dart';
import 'package:alquiler_app/presentation/screens/cliente/widgets/property_image_carousel_widget.dart';
import 'package:alquiler_app/presentation/screens/cliente/widgets/seller_info_widget.dart';
import 'package:flutter/material.dart';

class MyHomePageScreen extends StatelessWidget {
  const MyHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo
    final List<String> imageUrls = [
      'assets/images/property_1.jpg', 
    ];
    const String sellerName = 'Alfonso Diaz';
    const String modality = 'Venta';
    const String time = '3 años';
    const String balance = '\$90,000';
    const bool isCurrent = true; 
    const String status = 'Vendido'; 
    const String userRole = 'arrendatario';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi vivienda', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reutilizamos el carrusel de imágenes
            PropertyImageCarouselWidget(imageUrls: imageUrls),
            const SizedBox(height: 20),
            
            // Información del vendedor
            const SellerInfoWidget(sellerName: sellerName),
            const SizedBox(height: 20),

            // Información de pago
            const PaymentInfoWidget(
              modality: modality,
              time: time,
              balance: balance,
              isCurrent: isCurrent,
              status: status,
              UserRole: userRole,
            ),
          ],
        ),
      ),
    );
  }
}
