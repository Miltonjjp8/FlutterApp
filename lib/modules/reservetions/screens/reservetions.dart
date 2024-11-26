import 'package:flutter/material.dart';

class ReservationsWidget extends StatelessWidget {
  const ReservationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla reservaciones'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/top');
          },
          child: const Text('Ir a la pantalla Top'),
        ),
      ),
    );
  }
}
