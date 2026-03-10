import 'package:flutter/material.dart';
import 'package:loop_wear/setting_screen.dart';
import 'navigation_drawer_widget.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9F7F88),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'My Account',
          style: TextStyle(
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.bold,
            color :Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0xFFF0E4E7),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tartila Gofur',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFF9F7F88),
                fontWeight: FontWeight.w600,
              ),
            ),
           const SizedBox(height: 4),
            const Text(
              'tartila@example.com',
              style: TextStyle(color:Color(0xFF9F7F88), fontSize: 16),
            ),
           const SizedBox(height: 20),

           const Divider(thickness: 3,
             color:Color(0xFF9F7F88),
            ),

            ListTile(
              leading: const Icon(color:const Color(0xFF9F7F88),Icons.shopping_bag_outlined),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                  'My Orders',
                  style: TextStyle(color:Color(0xFF9F7F88), fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(color:const Color(0xFF9F7F88),Icons.settings_outlined),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                  'Settings',
                style: TextStyle(color:Color(0xFF9F7F88), fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(color:const Color(0xFF9F7F88),Icons.logout ),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                  'Logout',
                style: TextStyle(color:Color(0xFF9F7F88), fontSize: 20),
              ),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}