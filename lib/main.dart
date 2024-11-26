import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:milton_app/firebase_options.dart';
import 'package:milton_app/modules/auth/login.dart';
import 'package:milton_app/modules/tutorial/tutorial.dart';
import 'package:milton_app/navigation/map_sample.dart';
import 'package:milton_app/widgets/home.dart';
import 'package:milton_app/widgets/splash_screen.dart';
import 'package:milton_app/modules/home/screens/home.dart';
import 'package:milton_app/modules/reservetions/screens/reservetions.dart';
import 'package:milton_app/modules/top/screens/top.dart';
import 'package:milton_app/modules/profile/screens/profile.dart';
import 'package:milton_app/navigation/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/menu': (context) => const Navigation(),
        '/home': (context) => const Home(),
        // '/new': (context) => const MyWidget(),
        '/reservation': (context) => const ReservationsWidget(),
        '/top': (context) => const TopWidget(),
        '/profile': (context) => const ProfileScreen(),
        '/mapa': (context) => const MapSample(),
        '/tutorial': (context) => const Tutorial(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
