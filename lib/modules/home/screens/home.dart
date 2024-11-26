import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:milton_app/modules/auth/restaurant/restaurant.dart';
import 'package:milton_app/widgets/custom_list_restaurant.dart';
import 'package:milton_app/navigation/details.dart';

class home extends StatefulWidget {
  const home({
    super.key,
  });

  @override
  State<home> createState() => _HomeState();
}

class _HomeState extends State<home> {
  final db = FirebaseFirestore.instance;
  bool _isLoading = true;
  List<Restaurant> restaurants = [];

  @override
  void initState() {
    super.initState();
    (() async => {
          await db.collection("restaurants").snapshots().listen((event) {
            restaurants.clear();
            for (var doc in event.docs) {
              final restaurant = Restaurant(
                  doc.data()['name'],
                  doc.data()['descripcion'],
                  List<String>.from(doc['image']),
                  doc.data()['rating'],
                  doc.data()['count']);
              restaurants.add(restaurant);
            }
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          })
        })();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: ListView.separated(
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
              child: CustomListRestaurants(restaurants: restaurants[index]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/top'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
