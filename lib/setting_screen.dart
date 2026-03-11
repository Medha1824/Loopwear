import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF9F7F88),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
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
              style: TextStyle(fontSize: 22,color: Color(0xFF9F7F88), fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            const Text(
              'tartila@example.com',
              style: TextStyle(color: Color(0xFF9F7F88), fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 2,
                color:Color(0xFF9F7F88),
            ),
            ListTile(
              leading: const Icon(Icons.person,color: Color(0xFF9F7F88), ),
              title: const Text(
                  'Name',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text(
                  'Tartila Gofur',
                style: TextStyle(
                 // fontSize: 13,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),

              ),
              trailing: const Icon(Icons.edit,color: Color(0xFF9F7F88),),
              onTap: () {
              },
            ),

            ListTile(
              leading: const Icon(Icons.email,color: Color(0xFF9F7F88), ),
              title: const Text(
                  'Email',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text(
                  'tartila@example.com',
                style: TextStyle(
                  // fontSize: 13,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.edit,color: Color(0xFF9F7F88),),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Color(0xFF9F7F88),),
              title: const Text(
                  'Password',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text(
                  '********',
                style: TextStyle(
                  // fontSize: 13,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.edit,color: Color(0xFF9F7F88),),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Color(0xFF9F7F88),),
              title: const Text(
                  'Address',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text(
                  '123, Dhaka, Bangladesh',
                style: TextStyle(
                  // fontSize: 13,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.edit,color: Color(0xFF9F7F88),),
              onTap: () {
              },
            ),

            // Language
            ListTile(
              leading: const Icon(Icons.language,color: Color(0xFF9F7F88), ),
              title: const Text(
                  'Language',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text(
                  'English',
                style: TextStyle(
                  // fontSize: 13,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xFF9F7F88),),
              onTap: () {
              },
            ),

            const SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.keyboard_return,color: Color(0xFF9F7F88),),
              title: const Text(
                  'Return',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
              },
            ),
          ],

      ),
      )
    );
  }
}