import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCB7AE),
        title: const Text(
          'My Account',
          style: TextStyle(
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

       //body: Padding(
        // padding:const EdgeInsets.all(30),
      body: SingleChildScrollView(//widget for scrolling and for using column/row
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            // Name and Email
            const Text(
              'Tartila Gofur',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
           const SizedBox(height: 4),
            const Text(
              'tartila@example.com',
              style: TextStyle(color: Colors.blueGrey, fontSize: 16),
            ),
           const SizedBox(height: 20),

            // Divider
            const Divider(thickness: 3),

            // Options
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.brown),
              title: const Text('Edit Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined, color: Colors.brown),
              title: const Text('My Orders'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined, color: Colors.brown),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}