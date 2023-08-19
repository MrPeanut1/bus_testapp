import 'package:bus_testapp/screens/my_trips_screen.dart';
import 'package:bus_testapp/screens/show_map_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShowMapScreen()));
                },
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.blue.withOpacity(0.8),
                  child: const Center(
                    child: Text(
                      'Show Map',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyTripsScreen()));
                },
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.green.withOpacity(0.8),
                  child: const Center(
                    child: Text(
                      'My Trips',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




