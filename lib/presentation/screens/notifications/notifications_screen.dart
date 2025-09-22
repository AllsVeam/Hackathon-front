import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.notifications), centerTitle: true),
      body: Center(child: Text("?notificaciones")),
    );
  }
}
