import 'package:alquiler_app/presentation/screens/registro/registro_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alquiler_app/presentation/screens/registro/document_upload_screen.dart';

// La única definición del enum debe estar aquí.
enum UserRole { arrendador, arrendatario }

class LessorLesseeScreen extends StatefulWidget {
  const LessorLesseeScreen({super.key});

  @override
  State<LessorLesseeScreen> createState() => _LessorLesseeScreenState();
}

class _LessorLesseeScreenState extends State<LessorLesseeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  UserRole _selectedRole = UserRole.arrendador;

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Completa tu Registro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Datos Personales:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: customInputField(
                    hintText: 'Nombre',
                    controller: _nameController,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: customInputField(
                    hintText: 'Apellido',
                    controller: _lastNameController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            customInputField(
              hintText: 'Teléfono',
              controller: _phoneController,
              fieldType: FieldType.number,
            ),
            const SizedBox(height: 40),
            Text(
              'Selecciona tu rol:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            SegmentedButton<UserRole>(
              segments: const <ButtonSegment<UserRole>>[
                ButtonSegment<UserRole>(
                  value: UserRole.arrendador,
                  label: Text('Arrendador'),
                ),
                ButtonSegment<UserRole>(
                  value: UserRole.arrendatario,
                  label: Text('Arrendatario'),
                ),
              ],
              selected: <UserRole>{_selectedRole},
              onSelectionChanged: (Set<UserRole> newSelection) {
                setState(() {
                  _selectedRole = newSelection.first;
                });
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
            onPressed: () async {
              
              final user = FirebaseAuth.instance.currentUser;
              if (user == null) {
                
                return;
              }
              
              
              final userData = {
                'name': _nameController.text,
                'lastName': _lastNameController.text,
                'phone': _phoneController.text,
                'userRole': _selectedRole.name, 
              };
              
              
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .set(userData);
                  
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentUploadScreen(
                    userRole: _selectedRole,
                    name: _nameController.text,
                    lastName: _lastNameController.text,
                    phone: _phoneController.text,
                  ),
                ),
              );
            },
            child: const Text('Continuar'),
          ),
                    ],
                  ),
                ),
              );
            }

          

  Widget customInputField({
    required String hintText,
    TextEditingController? controller,
    FieldType fieldType = FieldType.text,
    int maxLength = 50,
  }) {
    TextInputType keyboardType = TextInputType.text;
    List<TextInputFormatter> inputFormatters = [];

    switch (fieldType) {
      case FieldType.number:
        keyboardType = TextInputType.number;
        inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(maxLength),
        ];
        break;
      default:
        keyboardType = TextInputType.text;
    }
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}