import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:milton_app/modules/auth/restaurant/restaurant.dart';
import 'package:milton_app/modules/top/screens/top.dart';
import 'package:milton_app/modules/reservetions/screens/reservetions.dart';
import 'package:milton_app/modules/profile/screens/profile.dart';
import 'package:milton_app/widgets/custom_list_restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'details.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    (() async {
      prefs = await SharedPreferences.getInstance();
      final bool? tutorial = prefs.getBool('tutorial');

      if (tutorial != null) {
        if (!tutorial) {
          Navigator.pushReplacementNamed(context, '/tutorial');
        }
      } else {
        Navigator.pushReplacementNamed(context, '/tutorial');
      }
    })();
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;
  bool _isLoading = true;
  List<Restaurant> restaurants = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchRestaurants();
  // }

  Future<void> _fetchRestaurants() async {
    db.collection("restaurants").snapshots().listen((event) {
      restaurants.clear();
      for (var doc in event.docs) {
        final restaurant = Restaurant(
          doc.data()['name'],
          doc.data()['descripcion'],
          List<String>.from(doc['image']),
          doc.data()['rating'],
          doc.data()['count'],
        );
        restaurants.add(restaurant);
      }
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  static List<Widget> _widgetOptions(
          bool isLoading, List<Restaurant> restaurants) =>
      <Widget>[
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: restaurants.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail(
                            images: restaurants[index].images,
                            name: restaurants[index].name,
                            description: restaurants[index].description,
                            rating: restaurants[index].rating,
                          ),
                        ),
                      );
                    },
                    child:
                        CustomListRestaurants(restaurants: restaurants[index]),
                  );
                },
              ),
        TopWidget(),
        ReservationsWidget(),
        ProfileScreen(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Sample'),
      ),
      body: Center(
        child:
            _widgetOptions(_isLoading, restaurants).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Top',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Reservations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
