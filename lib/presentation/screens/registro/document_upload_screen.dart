import 'package:alquiler_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen({super.key});

  @override
  State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  String? _selectedLocation;
  final List<String> _locations = ['Ciudad de México', 'Estado de México', 'Guadalajara', 'Monterrey'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Información'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo 'Ubicación'
            _buildDropdownField(context, 'Ubicación'),
            const SizedBox(height: 16),
                        
            // Campo de carga de INE
            _buildDocumentUploadField(context, 'INE', 'Subir'),
            const SizedBox(height: 16),
            
            // Campo de carga de Comprobante de domicilio
            _buildDocumentUploadField(context, 'Comprobante de domicilio', 'Subir'),
            const SizedBox(height: 16),

            // Campo de carga de RFC
            _buildDocumentUploadField(context, 'RFC', 'Subir'),
            const SizedBox(height: 32),
            
            // Botón 'Continuar'
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
                },
                child: const Text('Continuar', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(label),
          value: _selectedLocation, // Usa el valor de la variable de estado
          items: _locations.map((String location) {
            return DropdownMenuItem<String>(
              value: location,
              child: Text(location),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Actualiza el estado cuando se selecciona un nuevo valor
            setState(() {
              _selectedLocation = newValue;
            });
          },
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          TextButton(
            onPressed: () {
              // Lógica para seleccionar archivo
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}