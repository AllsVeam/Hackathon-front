import 'dart:io';

import 'package:alquiler_app/presentation/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:alquiler_app/presentation/screens/registro/lessor_lessee_screen.dart';
import 'package:image_picker/image_picker.dart';

class DocumentUploadScreen extends StatefulWidget {
  final UserRole userRole;
  final String name;
  final String lastName;
  final String phone;

  const DocumentUploadScreen({
    super.key,
    required this.userRole,
    required this.name,
    required this.lastName,
    required this.phone,
  });

  @override
  State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  // Variable para almacenar el archivo de la imagen
  File? _ineImage;

  // Instancia del ImagePicker
  final ImagePicker _picker = ImagePicker();

  // Método para tomar la fotografía
  Future<void> _takePhoto() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _ineImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subir Documentos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '¡Hola, ${widget.name} ${widget.lastName}!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text('Tu rol seleccionado es: ${widget.userRole.name}'),
            const SizedBox(height: 20),
            _buildDocumentUploadField(context, 'INE o Credencial escolar', 'Subir'),
            const SizedBox(height: 32),
            Text('Sube tu Documento para verificar que eres una persona real', textAlign: TextAlign.center),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Finalizar Registro', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentUploadField(BuildContext context, String title, String buttonText) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              TextButton(
                onPressed: _takePhoto, // Llama a la función para tomar la foto
                child: Text(buttonText),
              ),
            ],
          ),
          // Muestra la vista previa de la imagen si se ha tomado una
          if (_ineImage != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.file(_ineImage!),
            ),
        ],
      ),
    );
  }
}
