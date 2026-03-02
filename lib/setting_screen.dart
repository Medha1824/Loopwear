import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCB7AE),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
        children: [

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
            const Text(
              'Tartila Gofur',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            const Text(
              'tartila@example.com',
              style: TextStyle(color: Colors.blueGrey, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 2),

            // Name
            ListTile(
              leading: const Icon(Icons.person, color: Colors.brown),
              title: const Text('Name'),
              subtitle: const Text('Tartila Gofur'),
              trailing: const Icon(Icons.edit),
              onTap: () {
              },
            ),

            ListTile(
              leading: const Icon(Icons.email, color: Colors.brown),
              title: const Text('Email'),
              subtitle: const Text('tartila@example.com'),
              trailing: const Icon(Icons.edit),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.brown),
              title: const Text('Password'),
              subtitle: const Text('********'),
              trailing: const Icon(Icons.edit),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.brown),
              title: const Text('Address'),
              subtitle: const Text('123, Dhaka, Bangladesh'),
              trailing: const Icon(Icons.edit),
              onTap: () {
              },
            ),

            // Language
            ListTile(
              leading: const Icon(Icons.language, color: Colors.brown),
              title: const Text('Language'),
              subtitle: const Text('English'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),

            const SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.keyboard_return),
              title: const Text('Return'),
              onTap: () {
              },
            ),
          ],

      ),
      )
    );
  }
}