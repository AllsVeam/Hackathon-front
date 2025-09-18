import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:alquiler_app/presentation/providers/locale_provider.dart';
import 'package:alquiler_app/presentation/screens/home_page/home_page.dart';
import 'package:alquiler_app/presentation/screens/login_page/widgets/sign_in_button.dart';
import 'package:alquiler_app/presentation/screens/registro/registro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _emailFocus = FocusNode();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          actions: [
            DropdownButton<Locale>(
              value: Provider.of<LocaleProvider>(context).locale,
              underline: const SizedBox(),
              icon: const Icon(Icons.language, color: Colors.black),
              items: L10n.supportedLocales.map((locale) {
                final flag = locale.languageCode == 'en' ? '🇺🇸' : '🇪🇸';
                return DropdownMenuItem(value: locale, child: Text(flag));
              }).toList(),
              onChanged: (locale) {
                Provider.of<LocaleProvider>(
                  context,
                  listen: false,
                ).setLocale(locale!);
              },
            ),
          ],
        ),
        body: Center(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const BackButtonWidget(),
                          //const SizedBox(height: 32),
                          Center(
                            child: Text(
                              loc.welcomeBack,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Text(
                              loc.signInToYourAppAccout,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),

                          EmailField(
                            controller: _emailCtrl,
                            focusNode: _emailFocus,
                          ),
                          const SizedBox(height: 16),

                          const _PasswordField(),
                          const SizedBox(height: 8),

                          const _ForgotPasswordButton(),
                          const SizedBox(height: 8),

                          SignInButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                  (route) => false,
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 100),
                  padding: EdgeInsets.only(),
                  child: const _CreateAccountText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: loc.emailAddress,
        prefixIcon: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: const Icon(Icons.email_outlined),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).primaryColorDark,
      ),
      validator: (value) {
        final v = (value ?? '').trim();
        if (v.isEmpty) return loc.emailRequired;
        final emailReg = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,}$');
        if (!emailReg.hasMatch(v)) return loc.invalidEmail;
        return null;
      },
    );
  }
}

class _PasswordField extends StatefulWidget {
  const _PasswordField();

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (!_obscureText) {
        setState(() {
          _obscureText = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return TextField(
      controller: _controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: loc.password,
        suffixIcon: GestureDetector(
          onTap: () => setState(() => _obscureText = !_obscureText),
          child: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).primaryColorDark,
      ),
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          loc.forgotPassword,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

class _CreateAccountText extends StatelessWidget {
  const _CreateAccountText();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            loc.dontHaveAnAccount,
            style: TextStyle(color: Theme.of(context).primaryColorLight),
          ),
          const SizedBox(width: .05),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistroScreen()),
              );
            },
            child: Text(
              loc.createAccount,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
