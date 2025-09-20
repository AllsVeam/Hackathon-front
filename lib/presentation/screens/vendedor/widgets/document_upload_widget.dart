import 'package:flutter/material.dart';

class DocumentUploadWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool hasButton;

  const DocumentUploadWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.hasButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                style: BorderStyle.solid,
                width: 2.0,
              ),
            ),
            child: Center(
              child: hasButton
                  ? ElevatedButton(
                      onPressed: () {
                        // Lógica para subir archivo
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),
                      child: const Text('Subir'),
                    )
                  : Text(
                      subtitle ?? 'Arrastra y suelta o busca archivos',
                      style: const TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}