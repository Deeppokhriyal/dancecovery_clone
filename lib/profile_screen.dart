import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Section
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFD1D5F0), // light purple background
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // Profile Avatar
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.person, size: 50, color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Shivanshi Mishra",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Buttons List
                  _buildMenuItem(Icons.edit, "Edit Profile"),
                  _buildMenuItem(Icons.history, "Purchase History"),
                  _buildMenuItem(Icons.lightbulb_outline, "Give Feedback"),
                  _buildMenuItem(Icons.privacy_tip_outlined, "Privacy Policy"),
                  _buildMenuItem(Icons.logout, "Logout", color: Colors.orange),
                  _buildMenuItem(Icons.delete, "Delete account", color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Menu Item Widget
  static Widget _buildMenuItem(IconData icon, String title, {Color? color}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: color ?? Colors.black),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: color ?? Colors.black,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}
