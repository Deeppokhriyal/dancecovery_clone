import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with name and avatar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(height: 50),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/icons/user.png'), // Your image here
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Deep Celestial',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'dancecovery@gmail.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '+358 724 819 7717',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.edit, color: Colors.grey),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Card Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildTile(Icons.edit, 'Edit Profile'),
                  _buildTile(Icons.history, 'Purchase History'),
                  _buildTile(Icons.lock_outline, 'Change Password'),
                  _buildTile(Icons.email_outlined, 'Change Email Address'),
                  _buildTile(Icons.lightbulb_outline, 'Give Feedback'),
                  _buildTile(Icons.privacy_tip_outlined, 'Privacy Policy'),
                  const Divider(height: 24),
                  _buildTile(Icons.logout, 'Logout', iconColor: Colors.red, textColor: Colors.red),
                  _buildTile(Icons.delete_outline, 'Delete Account', iconColor: Colors.red, textColor: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(IconData icon, String title,
      {Color iconColor = Colors.blue, Color textColor = Colors.black}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  Widget _buildSwitchTile(IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        trailing: Switch(
          value: true,
          onChanged: (val) {},
          activeColor: Colors.blue,
        ),
      ),
    );
  }
}
