import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:alquiler_app/presentation/screens/auth/auth.dart';
import 'package:alquiler_app/presentation/screens/auth/auth_Register.dart';
import 'package:alquiler_app/presentation/widgets/buttons.dart';
import 'package:alquiler_app/presentation/widgets/icon_backgr.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart'; // Importa este paquete para TapGestureRecognizer

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final Color blueColor = const Color.fromARGB(255, 13, 72, 161);
  final Color blueColoropaco = const Color.fromARGB(118, 13, 72, 161);

  void _onButtonPressed(int items) {
    if (_currentIndex < items - 1) {
      _carouselController.nextPage();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AuthRegister()),
      );
    }
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://wallet.interledger-test.dev/');
    if (!await launchUrl(url)) {
      throw 'No se pudo abrir la URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isLigth = Theme.of(context).brightness == Brightness.light;

    final List<Map<String, dynamic>> items = [
      {
        'icon': Icons.wallet_outlined,
        'title': loc.carrouseltitle1,
        // Usamos una sola clave 'subtitle' que contendrá el RichText.
        'subtitle': RichText(
          textAlign: TextAlign.center, // Alinea el texto del RichText
          text: TextSpan(
            children: [
              TextSpan(
                text: loc.carrouselsubtitle1 + ' \n',
                style: TextStyle(
                  // Estilo para el texto principal
                  color: Colors.grey[600],
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                ),
              ),
              TextSpan(
                text: "URL:https://wallet.interledger-test.dev/",
                style: TextStyle(
                  // Estilo para el enlace
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                ),
                // Aquí es donde se hace clicable
                recognizer: TapGestureRecognizer()..onTap = _launchUrl,
              ),
            ],
          ),
        ),
      },
      {
        'icon': Icons.shield_outlined,
        'title': loc.carrouseltitle2,
        // Para los otros items, el 'subtitle' sigue siendo un String
        'subtitle': Text(
          loc.carrouselsubtitle2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.018,
            color: Colors.grey[600],
          ),
        ),
      },
      {
        'icon': Icons.phone_iphone,
        'title': loc.carrouseltitle3,
        'subtitle': Text(
          loc.carrouselsubtitle3,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.018,
            color: Colors.grey[600],
          ),
        ),
      },
      {
        'icon': Icons.phone_outlined,
        'title': "hola mundo",
        'subtitle': Text(
          "hols hols",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.018,
            color: Colors.grey[600],
          ),
        ),
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.5,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    viewportFraction: 0.9,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: items.map((item) {
                    return Column(
                      children: [
                        LogoAndbBackground(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.height * 0.20,
                          icon: item['icon'],
                          iconColor: blueColor,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(26, 47, 154, 255),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          item['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: isLigth ? Colors.black87 : Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          // Aquí usamos el subtítulo que puede ser un Widget o un String
                          // Por eso, es mejor que todos los 'subtitle' sean widgets para evitar errores.
                          child: item['subtitle'],
                        ),
                      ],
                    );
                  }).toList(),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(items.length, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              width: _currentIndex == index ? 20.0 : 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  _currentIndex == index ? 4 : 50,
                                ),
                                color: _currentIndex == index
                                    ? blueColor
                                    : blueColoropaco,
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => _onButtonPressed(items.length),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _currentIndex == items.length - 1
                                    ? loc.buttonNext
                                    : loc.buttonNext2,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward, size: 18),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        TexButton(
                          text: loc.buttonSkip,
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          onPressed: () {
                            _carouselController.jumpToPage(items.length - 1);
                            _onButtonPressed(items.length);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
