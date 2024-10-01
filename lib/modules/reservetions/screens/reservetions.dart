import 'package:flutter/material.dart';

class ReservationsWidget extends StatelessWidget {
  const ReservationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla reservaciones'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/top');
          },
          child: Text('Ir a la pantalla Top'),
        ),
      ),
    );
  }
}
