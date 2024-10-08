import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'BM',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Milton Jaimes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Hace 5 min',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              Spacer(), // Empuja el ícono a la derecha
              Padding(
                padding: EdgeInsets.all(16.0), // Mantén el padding aquí
                child: Icon(Icons.more_vert),
              ),
            ],
          ),
          Image.asset(
            'assets/septiembre.png',
            width: double.infinity,
            height: 400,
          ),
          Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Icon(Icons.message),
              Icon(Icons.send),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
