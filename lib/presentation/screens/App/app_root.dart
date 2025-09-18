import 'package:alquiler_app/core/themes/theme.dart';
import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:alquiler_app/presentation/providers/locale_provider.dart';
import 'package:alquiler_app/presentation/providers/theme/theme_provider.dart';
import 'package:alquiler_app/presentation/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      locale: localeProvider.locale,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode,
      home: WelcomeScreen(),
    );
  }
}
