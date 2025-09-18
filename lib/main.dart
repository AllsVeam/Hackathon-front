import 'package:alquiler_app/presentation/providers/cards_provider.dart';
import 'package:alquiler_app/presentation/providers/locale_provider.dart';
import 'package:alquiler_app/presentation/providers/theme/theme_provider.dart';
import 'package:alquiler_app/presentation/screens/App/app_root.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 2));

  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(
          create: (_) => CardsProvider(userId: 123456)..loadCards(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const AppRoot(),
    );
  }
}
