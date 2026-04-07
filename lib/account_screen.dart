import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loop_wear/Order_history.dart';
import 'package:loop_wear/cart_controller.dart';
import 'package:loop_wear/navigation_bar.dart';
import 'package:loop_wear/setting_screen.dart';

import 'favourite_controller.dart';
import 'login_screen.dart';
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
            color: Colors.white,
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
              style: TextStyle(color: Color(0xFF9F7F88), fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(
              thickness: 3,
              color: Color(0xFF9F7F88),
            ),

            // My Orders
            ListTile(
              leading: const Icon(
                Icons.shopping_bag_outlined,
                color: Color(0xFF9F7F88),
              ),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'My Orders',
                style: TextStyle(color: Color(0xFF9F7F88), fontSize: 20),
              ),
              onTap: () {
                Get.to(() => const OrderHistoryPage());
              },
            ),

            // Settings
            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                color: Color(0xFF9F7F88),
              ),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Settings',
                style: TextStyle(color: Color(0xFF9F7F88), fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingScreen(),
                  ),
                );
              },
            ),

            // Logout
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Color(0xFF9F7F88),
              ),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Logout',
                style: TextStyle(color: Color(0xFF9F7F88), fontSize: 20),
              ),
              onTap: () async {
                try {
                  // 1. Clear cart
                  CartController.instance.clearCart();

                  // 2. Clear wishlist
                  final favController = Get.find<FavouriteController>();
                  favController.favourites.clear();

                  // 3. Sign out from Firebase
                  await FirebaseAuth.instance.signOut();

                  // 4. Go to login screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false,
                  );
                } catch (e) {
                  print("Logout error: $e");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Logout failed: ${e.toString()}")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}