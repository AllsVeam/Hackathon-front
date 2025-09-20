import 'package:flutter/material.dart';
import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:alquiler_app/presentation/screens/registro/document_upload_screen.dart';

enum UserRole { arrendador, arrendatario }

class LessorLesseeScreen extends StatefulWidget {
  const LessorLesseeScreen({super.key});

  @override
  State<LessorLesseeScreen> createState() => _LessorLesseeScreenState();
}

class _LessorLesseeScreenState extends State<LessorLesseeScreen> {
  UserRole _selectedRole = UserRole.arrendador;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar Rol')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              onPressed: () {
                print('Rol seleccionado: ${_selectedRole.name}');
                // Aquí va la lógica para navegar a la siguiente pantalla
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DocumentUploadScreen()),
                );
              },
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}