import 'package:alquiler_app/presentation/screens/cliente/widgets/property_location_widget.dart';
import 'package:alquiler_app/presentation/screens/vendedor/widgets/cost_and_time_input_widget.dart';
import 'package:alquiler_app/presentation/screens/vendedor/widgets/image_upload_widget.dart';
import 'package:alquiler_app/presentation/screens/vendedor/widgets/property_form_field_widget.dart';
import 'package:flutter/material.dart';

class PublishPropertyScreen extends StatefulWidget {
  const PublishPropertyScreen({super.key});

  @override
  State<PublishPropertyScreen> createState() => _PublishPropertyScreenState();
}

class _PublishPropertyScreenState extends State<PublishPropertyScreen> {
  String? _selectedOption = 'Vender';
  final List<String> _options = ['Vender', 'Rentar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renta/Vende', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownSelector(),
            const SizedBox(height: 20),
            const PropertyFormFieldWidget(label: 'Título', hintText: 'Ingrese el título de la propiedad'),
            const SizedBox(height: 20),
            const PropertyFormFieldWidget(label: 'Descripción', hintText: 'Ingrese la descripción', maxLines: 5),
            const SizedBox(height: 20),
            _buildLocationSection(),
            const SizedBox(height: 20),
            CostAndTimeInputWidget(selectedOption: _selectedOption!),
            const SizedBox(height: 20),
            const ImageUploadWidget(),
            const SizedBox(height: 30),
            _buildPublishButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Selecciona', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedOption,
              items: _options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PropertyLocationWidget(address: 'Av. Jardines Tepeyac 17'),
        // proximo: lógica para seleccionar la ubicación en un mapa real
      ],
    );
  }

  Widget _buildPublishButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Lógica para guardar y publicar la propiedad
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Text('Guardar y Publicar', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}