import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:alquiler_app/presentation/screens/home_page/home_page.dart';
import 'package:alquiler_app/presentation/screens/login_page/login_page.dart';
import 'package:alquiler_app/presentation/screens/registro/dto/userRegist.dart';
import 'package:alquiler_app/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

Color color = const Color.fromARGB(255, 100, 100, 100);
Color colorblack = Colors.black;

Color _nameBorderColor = Colors.grey;
Color _lastNameBorderColor = Colors.grey;
Color _emailBorderColor = Colors.grey;
Color _phoneBorderColor = Colors.grey;
Color _passwordBorderColor = Colors.grey;
Color _confirmPasswordBorderColor = Colors.grey;

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateFields() {
    setState(() {
      _nameBorderColor = _nameController.text.isEmpty
          ? Colors.red
          : Colors.grey;

      _lastNameBorderColor = _lastNameController.text.isEmpty
          ? Colors.red
          : Colors.grey;

      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      _emailBorderColor = emailRegex.hasMatch(_emailController.text)
          ? Colors.grey
          : Colors.red;

      final phoneRegex = RegExp(r'^\d{1,12}$');
      _phoneBorderColor = phoneRegex.hasMatch(_phoneController.text)
          ? Colors.grey
          : Colors.red;

      final password = _passwordController.text;
      final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~.,;:\+\-\_\%\?]).{12,}$',
      );
      _passwordBorderColor = passwordRegex.hasMatch(password)
          ? Colors.grey
          : Colors.red;

      _confirmPasswordBorderColor =
          (password == _confirmPasswordController.text &&
              _confirmPasswordController.text.isNotEmpty)
          ? Colors.grey
          : Colors.red;
    });
  }

  void _validateAndGenerateJson() {
    _validateFields();

    if (_nameBorderColor == Colors.grey &&
        _lastNameBorderColor == Colors.grey &&
        _emailBorderColor == Colors.grey &&
        _phoneBorderColor == Colors.grey &&
        _passwordBorderColor == Colors.grey &&
        _confirmPasswordBorderColor == Colors.grey) {
      final user = UserRegistration(
        name: _nameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
      );

      final jsonData = user.toJsonString();
      print("JSON generado: $jsonData");

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Datos en JSON"),
            content: Text(jsonData),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print("Algunos campos no son válidos");
    }
  }

  @override
  void initState() {
    super.initState();
    _resetBorderColors();
  }

  void _resetBorderColors() {
    _nameBorderColor = Colors.grey;
    _lastNameBorderColor = Colors.grey;
    _emailBorderColor = Colors.grey;
    _phoneBorderColor = Colors.grey;
    _passwordBorderColor = Colors.grey;
    _confirmPasswordBorderColor = Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextTitle(
                  text: loc.createAccountTitle,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextTitle(
                  text: loc.createAccountSubtitle,
                  style: TextStyle(
                    color: color,
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: customInputField(
                      icon: Icons.account_circle,
                      hintText: loc.inputName,
                      controller: _nameController,
                      borderColor: _nameBorderColor,
                      colorText: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: customInputField(
                      icon: Icons.account_circle,
                      hintText: loc.inputLastName,
                      controller: _lastNameController,
                      borderColor: _lastNameBorderColor,
                      colorText: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),
              customInputField(
                icon: Icons.email_outlined,
                hintText: loc.inputEmail,
                controller: _emailController,
                fieldType: FieldType.email,
                borderColor: _emailBorderColor,
                colorText: Theme.of(context).primaryColorLight,
              ),
              const SizedBox(height: 25),
              customInputField(
                icon: Icons.phone,
                hintText: loc.inputPhone,
                controller: _phoneController,
                borderColor: _phoneBorderColor,
                fieldType: FieldType.number,
                maxLength: 12,
                colorText: Theme.of(context).primaryColorLight,
              ),
              const SizedBox(height: 25),
              PasswordField(
                controller: _passwordController,
                hintText: loc.inputPassword,
                borderColor: _passwordBorderColor,
              ),
              const SizedBox(height: 25),
              PasswordField(
                controller: _confirmPasswordController,
                hintText: loc.inputConfirmPassword,
                borderColor: _confirmPasswordBorderColor,
              ),
              const SizedBox(height: 25),
              Center(child: Button(onPressedAction: _validateAndGenerateJson)),
              const SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      loc.alreadyHaveAccount,
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        loc.linkSignIn,
                        style: TextStyle(
                          color: Color.fromARGB(255, 30, 64, 175),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum FieldType { text, number, email }

Widget customInputField({
  IconData? icon,
  required String hintText,
  TextEditingController? controller,
  Color borderColor = Colors.grey,
  FieldType fieldType = FieldType.text,
  int maxLength = 50,
  FocusNode? focusNode,
  VoidCallback? onValidate,
  Color? colorText = Colors.black,
}) {
  TextInputType keyboardType = TextInputType.text;
  List<TextInputFormatter> inputFormatters = [];

  switch (fieldType) {
    case FieldType.number:
      keyboardType = TextInputType.number;
      inputFormatters = [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(maxLength),
      ];
      break;
    case FieldType.email:
      keyboardType = TextInputType.emailAddress;
      inputFormatters = [LengthLimitingTextInputFormatter(maxLength)];
      break;
    case FieldType.text:
      keyboardType = TextInputType.text;
      inputFormatters = [
        FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]")),
        LengthLimitingTextInputFormatter(maxLength),
      ];
      break;
  }
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: borderColor, width: 1.5),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      onChanged: (_) => onValidate?.call(),
      style: TextStyle(fontSize: 16, color: colorText),
      decoration: InputDecoration(
        icon: icon != null ? Icon(icon, color: color) : null,
        hintText: hintText,
        hintStyle: TextStyle(color: color, fontSize: 16),
        border: InputBorder.none,
      ),
    ),
  );
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Color borderColor;

  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon = Icons.lock,
    this.borderColor = Colors.grey,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.borderColor, width: 1.5),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).primaryColorLight,
        ),
        onChanged: (_) {
          final parent = context
              .findAncestorStateOfType<_RegistroScreenState>();
          parent?._validateFields();
        },
        decoration: InputDecoration(
          icon: Icon(widget.icon, color: color),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: color, fontSize: 16),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: color,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final VoidCallback onPressedAction;

  const Button({super.key, required this.onPressedAction});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.70,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 30, 64, 175),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressedAction,
        child: Text(
          loc.buttonCreateAccount,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
