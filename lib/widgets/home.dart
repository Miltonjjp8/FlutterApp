import 'package:flutter/material.dart';
import 'package:milton_app/widgets/Content_column.dart'; // Asegúrate de tener la importación correcta

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, // Distribuye los elementos de forma pareja
          children: [
            Expanded(
              child: ContentColumn(
                title: 'Primer título',
                description: 'Primer párrafo',
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Otra línea'),
                    Text('segundo renglón'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Otra línea'),
                    Text('tercer renglón'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/new'); // Navega a la pantalla 'New'
                },
                child: Text('Ir a la pantalla home'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        onPressed: () => print('Hola'),
        child: const Icon(Icons.home),
      ),
    );
  }
}
