import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:alquiler_app/presentation/providers/locale_provider.dart';
import 'package:alquiler_app/presentation/screens/auth/auth.dart';
import 'package:alquiler_app/presentation/screens/carousel/carousel_screen.dart';
import 'package:alquiler_app/presentation/screens/login_page/login_page.dart';
import 'package:alquiler_app/presentation/widgets/buttons.dart';
import 'package:alquiler_app/presentation/widgets/icon_backgr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Color whiteSolid = Colors.white;
final Color white = Color.fromARGB(255, 212, 227, 252);

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              gradient(),
              Positioned(
                top: 16,
                right: 16,
                child: Material(
                  color: Colors.transparent,
                  child: DropdownButton<Locale>(
                    value: Provider.of<LocaleProvider>(context).locale,
                    underline: const SizedBox(),
                    icon: const Icon(Icons.language, color: Colors.white),
                    items: L10n.supportedLocales.map((locale) {
                      final flag = locale.languageCode == 'en'
                          ? '🇺🇸'
                          : '🇪🇸';
                      return DropdownMenuItem(
                        value: locale,
                        child: Text(flag, style: const TextStyle(fontSize: 20)),
                      );
                    }).toList(),
                    onChanged: (locale) {
                      Provider.of<LocaleProvider>(
                        context,
                        listen: false,
                      ).setLocale(locale!);
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  LogoAndbBackground(
                    icon: Icons.wallet_outlined,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(97, 255, 255, 255),
                    ),
                  ),
                  TextTitle(
                    text: 'RoomiePay',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextTitle(
                    text: loc.subtitleWelcome,
                    style: TextStyle(
                      color: white,
                      fontSize: MediaQuery.of(context).size.height * 0.019,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  ColumInfo(),
                  const Spacer(),
                  Button(),
                  TexButton(
                    text: loc.textButtonWel,
                    style: TextStyle(color: whiteSolid, fontSize: 18),
                    onPressed: () {
                      //TODO: aqui se hace el cambio con el login y despues al registro, lo puse asi por falta del login para redericcionar
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthLogin() /*LoginPage()*/,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.40,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: whiteSolid,
          foregroundColor: Colors.blue[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CarouselScreen()),
          );
        },
        child: Text(
          loc.buttonGetWel,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ColumInfo extends StatelessWidget {
  const ColumInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextAndIcon(
          icon: Icon(Icons.shield_outlined, color: whiteSolid, size: 35),
          text: Text(
            loc.textInfoSecure,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.018,
              color: white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        SizedBox(height: 20),
        TextAndIcon(
          icon: Icon(Icons.flash_on, color: whiteSolid, size: 35),
          text: Text(
            loc.textInfoTransfer,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.018,
              color: white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}

class TextAndIcon extends StatelessWidget {
  final Icon icon;
  final Text text;

  const TextAndIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisSize: MainAxisSize.min, children: [icon, text]),
    );
  }
}

// ignore: camel_case_types
class gradient extends StatelessWidget {
  const gradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.deepPurple, Color.fromARGB(255, 50, 0, 97)],
        ),
        //color: Colors.deepPurple,
      ),
    );
  }
}
