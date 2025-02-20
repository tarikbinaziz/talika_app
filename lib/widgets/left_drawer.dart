import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildHeader(context), // Profile Header
          _buildDrawerItem(
            icon: Icons.home,
            text: "হোম",
            onTap: () {
              Navigator.pop(context);
              // Navigate to Home Screen
            },
          ),
          _buildDrawerItem(
            icon: Icons.person,
            text: "প্রোফাইল",
            onTap: () {
              Navigator.pop(context);
              // Navigate to Profile Screen
            },
          ),
          _buildDrawerItem(
            icon: Icons.settings,
            text: "সেটিংস",
            onTap: () {
              Navigator.pop(context);
              // Navigate to Settings Screen
            },
          ),
          const Spacer(), // Push Logout to Bottom
          Divider(),
          _buildDrawerItem(
            icon: Icons.logout,
            text: "লগআউট",
            color: Colors.red,
            onTap: () {
              Navigator.pop(context);
              // Handle logout
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // **Drawer Header**
  Widget _buildHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text("তারিক বিন আজিজ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      accountEmail: Text("mdtarikbinaziz@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.person, size: 40, color: Colors.teal),
      ),
      decoration: BoxDecoration(
        color: Colors.teal,
      ),
    );
  }

  // **Reusable Drawer Item**
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color color = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color, fontSize: 16)),
      onTap: onTap,
    );
  }
}
