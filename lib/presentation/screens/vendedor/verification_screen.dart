import 'package:alquiler_app/presentation/screens/vendedor/widgets/document_upload_widget.dart';
import 'package:alquiler_app/presentation/screens/vendedor/widgets/dropdown_input_widget.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String? _selectedLocation;
  String? _selectedPriceRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dropdowns
            DropdownInputWidget(
              label: 'Ubicación',
              hintText: 'Selecciona una ubicación',
              items: const ['Ciudad de México', 'Guadalajara', 'Monterrey'],
              selectedValue: _selectedLocation,
              onChanged: (newValue) {
                setState(() {
                  _selectedLocation = newValue;
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownInputWidget(
              label: 'Rango de precios',
              hintText: 'Selecciona un rango',
              items: const ['\$1M - \$2M', '\$2M - \$5M', '+\$5M'],
              selectedValue: _selectedPriceRange,
              onChanged: (newValue) {
                setState(() {
                  _selectedPriceRange = newValue;
                });
              },
            ),

            // Documentos
            const DocumentUploadWidget(
              title: 'INE',
              hasButton: true,
            ),
            const SizedBox(height: 10),
            const DocumentUploadWidget(
              title: 'Comprobante de domicilio',
              subtitle: 'Arrastra y suelta, o busca archivos',
            ),
            const SizedBox(height: 10),
            const DocumentUploadWidget(
              title: 'RFC',
              subtitle: 'Arrastra y suelta, o busca archivos',
            ),
            const SizedBox(height: 30),

            // Botón de continuar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para continuar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Continuar', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}