import 'package:bus_testapp/screens/authenticate/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:bus_testapp/screens/my_trips_screen.dart';
import 'package:bus_testapp/screens/show_map_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        // Add the hamburger menu icon
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer Header with rounded image
            UserAccountsDrawerHeader(
              accountName: const Text('John Doe'),
              accountEmail: const Text('johndoe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromARGB(220, 0, 0, 0),
                child: ClipOval(
                  child: Image.asset(
                    'assets/user.png', // Replace with your app's logo image path
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(220, 0, 0, 0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/user.png', // Replace with another logo if needed
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              onDetailsPressed: () {
                // Handle user details navigation
              },
            ),
            // Divider
            const Divider(),
            // Drawer Items
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Show Map'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowMapScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('My Trips'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyTripsScreen(),
                  ),
                );
              },
            ),
            // Logout option
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.5), // Adjust opacity here
            width: double.infinity,
            height: double.infinity,
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShowMapScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 250,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.yellow, // Yellow background
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                    ),
                    child: const Center(
                      child: Text(
                        'Take a bus',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
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
                        builder: (context) => const MyTripsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 250,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.green, // Green background
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                    ),
                    child: const Center(
                      child: Text(
                        'View past trips',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
