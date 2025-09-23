import 'package:alquiler_app/presentation/screens/cliente/property_detail_screen.dart';
import 'package:alquiler_app/presentation/screens/cliente/widgets/payment_info_widget.dart';
import 'package:alquiler_app/presentation/screens/cliente/widgets/property_image_carousel_widget.dart';
import 'package:alquiler_app/presentation/screens/vendedor/publish_property_screen.dart';
import 'package:alquiler_app/presentation/screens/vendedor/widgets/buyer_info_widget.dart';
import 'package:alquiler_app/presentation/screens/vendedor/widgets/my_properties_button_widget.dart';
import 'package:alquiler_app/presentation/screens/vendedor/widgets/property_status_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPropertiesListScreen extends StatefulWidget {
  const MyPropertiesListScreen({super.key});

  @override
  State<MyPropertiesListScreen> createState() => _MyPropertiesListScreenState();
}

class _MyPropertiesListScreenState extends State<MyPropertiesListScreen> {
  String? _userRole;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
  }

  Future<void> _fetchUserRole() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          _userRole = userDoc.get('userRole');
        });
      }
    } catch (e) {
      // Manejar el error, por ejemplo, mostrando un mensaje
      debugPrint('Error fetching user role: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis propiedades', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Propiedad 1: Vendida
                    _buildPropertyItem(
                      context,
                      propertyTitle: 'Casa familiar en Condesa',
                      imageUrls: ['assets/images/property_4.jpg'],
                      buyerName: 'Alicia Lopez',
                      modality: 'Venta',
                      time: '3 años',
                      balance: '\$10,000',
                      isCurrent: true,
                      status: 'Vendido',
                      userRole: _userRole,
                    ),
                    const SizedBox(height: 20),

                    // Propiedad 2: Publicado
                    _buildPropertyItem(
                      context,
                      propertyTitle: 'Departamento en Polanco',
                      imageUrls: ['assets/images/property_2.jpg'],
                      buyerName: 'Sin comprador',
                      modality: 'Renta',
                      time: '6 meses',
                      balance: '\$0',
                      isCurrent: true,
                      status: 'Publicado',
                      userRole: _userRole,
                    ),
                    const SizedBox(height: 20),

                    // Propiedad 3: En Revisión (ejemplo)
                    _buildPropertyItem(
                      context,
                      propertyTitle: 'Terreno en la Roma',
                      imageUrls: ['assets/images/property_3.jpg'],
                      buyerName: 'Pendiente',
                      modality: 'Venta',
                      time: 'N/A',
                      balance: '\$0',
                      isCurrent: true,
                      status: 'Revisión',
                      userRole: _userRole,
                    ),
                    const SizedBox(height: 30),

                    // Botón "Publicar nuevo" solo se muestra si el rol es "arrendador"
                    if (_userRole == 'arrendador')
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
    required String? userRole, 
  }) {
    
    String displayedStatus = status;
    if (userRole == 'arrendatario') {
      if (status == 'Vendido' || status == 'Rentado') {
        displayedStatus = 'Rentado';
      } else if (status == 'Publicado') {
        displayedStatus = 'Sin estatus';
      } else {
       
        displayedStatus = status;
      }
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: PropertyStatusChipWidget(status: displayedStatus),
            ),
            const SizedBox(height: 10), 
            
            PropertyImageCarouselWidget(imageUrls: [imageUrls.first]),
            const SizedBox(height: 10),

            BuyerInfoWidget(buyerName: buyerName),
            const SizedBox(height: 10),

            PaymentInfoWidget(
              modality: modality,
              time: time,
              balance: balance,
              isCurrent: isCurrent,
              userRole: userRole,
              status: status, 
            ),
            
            // El botón "Ver detalle" ahora siempre se muestra
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