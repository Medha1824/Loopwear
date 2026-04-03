import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9F7F88),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Order History',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('orders')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("No orders found"));
          }

          final orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final data = orders[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ExpansionTile(
                  title: Text("Order ID: ${data['orderId']}"),
                  subtitle: Text(
                      "Total: ${data['totalPrice']} | Items: ${data['totalItems']}"),

                ),
              );
            },
          );
        },
      ),
    );
  }
}