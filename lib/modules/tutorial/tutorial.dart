import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void _onItem() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('tutorial', true);
}

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  Future<void> _onItem() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('tutorial', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  'assets/image.png'), // Ruta a la imagen que deseas mostrar
              const SizedBox(height: 20),
              const Text(
                'Bienvenido',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  _onItem(); // Guarda el estado de tutorial completado
                  Navigator.pushReplacementNamed(context, '/menu');
                },
                child: const Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
