import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF2E5E3A), // Dark green background
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          SizedBox(height: 60),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white60,
          ),
          SizedBox(height: 10),
          Text(
            'Your Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                children: [
                  _buildListTile(Icons.edit, 'Edit Profile'),
                  _buildListTile(Icons.history, 'Purchase History'),
                  _buildListTile(Icons.lock_outline, 'Change Password'),
                  _buildListTile(Icons.email_outlined, 'Change Email Address'),
                  _buildListTile(Icons.lightbulb_outline, 'Give Feedback'),
                  _buildListTile(Icons.privacy_tip_outlined, 'Privacy Policy'),
                  Divider(),
                  _buildListTile(Icons.logout, 'Logout', iconColor: Colors.red, textColor: Colors.red),
                  _buildListTile(Icons.delete_outline, 'Delete account', iconColor: Colors.red, textColor: Colors.red),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, {Color iconColor = Colors.black, Color textColor = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(color: textColor, fontSize: 19,fontFamily: 'sans-serif-light'),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 17, color: iconColor),
      onTap: () {
        // Handle navigation
      },
    );
  }
}
