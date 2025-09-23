import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:alquiler_app/presentation/screens/welcome/welcome_screen.dart';

class CustomProfileScreen extends StatefulWidget {
  const CustomProfileScreen({super.key});

  @override
  State<CustomProfileScreen> createState() => _CustomProfileScreenState();
}

class _CustomProfileScreenState extends State<CustomProfileScreen> {
  Map<String, dynamic>? _userData;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      setState(() {
        _error = 'Usuario no autenticado.';
        _isLoading = false;
      });
      return;
    }

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          _userData = userDoc.data() as Map<String, dynamic>?;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error al cargar los datos: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text('Error: $_error'))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      // El widget de Firebase para el perfil
                      // Se le asigna una altura fija para evitar el error de tamaño infinito
                      SizedBox(
                        height: 500, // Ajusta esta altura según sea necesario
                        child: ProfileScreen(
                          actions: [
                            SignedOutAction((context) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                                (route) => false,
                              );
                            }),
                          ],
                        ),
                      ),
                      // Agrega aquí la información personalizada del usuario
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            Text(
                              'Datos Personales',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 10),
                            _buildInfoRow('Nombre:', '${_userData?['name'] ?? 'N/A'}'),
                            _buildInfoRow('Apellido:', '${_userData?['lastName'] ?? 'N/A'}'),
                            _buildInfoRow('Teléfono:', '${_userData?['phone'] ?? 'N/A'}'),
                            _buildInfoRow('Rol:', '${_userData?['userRole'] ?? 'N/A'}'),
                          ],
                        ),
                      ),
                      // Puedes agregar aquí otros botones o widgets personalizados
                    ],
                  ),
                ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
