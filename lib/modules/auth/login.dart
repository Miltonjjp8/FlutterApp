import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milton_app/kernel/widgets/custom_text_field_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
        centerTitle: false,
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/septiembre.png',
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                    validator: validateEmail,
                    controller: _email,
                    decoration: const InputDecoration(
                        hintText: 'Correo electrónico',
                        label: Text('Correo electrónico')),
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 16,
                ),
                TextFieldPassword(controller: _password),
                const SizedBox(height: 16, width: double.infinity),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _email.text,
                                    password: _password.text);
                            // Verificar si el tutorial ya se completó después de logearse
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            final bool tutorialCompleted =
                                prefs.getBool('tutorial') ?? false;
                            if (tutorialCompleted) {
                              Navigator.pushReplacementNamed(
                                  context, '/home'); // Ir a Home
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, '/tutorial'); // Ir a Tutorial
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: const Text('Iniciar sesión')),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/register'),
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
