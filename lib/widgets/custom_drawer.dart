import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final void Function()? onShowMapSelected;
  final void Function()? onMyTripsSelected;
  final void Function()? onUserDetailsSelected;
  final void Function()? onLogoutSelected;

  const CustomDrawer({super.key, 
    required this.onShowMapSelected,
    required this.onMyTripsSelected,
    required this.onUserDetailsSelected,
    required this.onLogoutSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(child: null,
            // ... customize header as needed ...
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Show Map'),
            onTap: onShowMapSelected,
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('My Trips'),
            onTap: onMyTripsSelected,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User Details'),
            onTap: onUserDetailsSelected,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: onLogoutSelected,
          ),
        ],
      ),
    );
  }
}
