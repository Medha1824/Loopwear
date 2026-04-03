import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loop_wear/cart_controller.dart';
import 'package:loop_wear/order_confirm_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final CartController cartController = CartController.instance;

  int discount = 0;
  int shipping = 0;

  int get total => cartController.subtotal.toInt() + discount + shipping;

  void showPaymentBottomSheet(BuildContext context, String method) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController pinController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "$method Payment",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9F7F88),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: pinController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "PIN",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9F7F88),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Confirm Payment"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF9F7F88),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Check Out',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery Address',
              style: TextStyle(
                  color: Color(0xFF9F7F88),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Color(0xFF9F7F88)),
                title: const Text('Mirpur 2'),
                subtitle: const Text('Rupnagar, Dhaka'),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment Method',
              style: TextStyle(
                  color: Color(0xFF9F7F88),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.payment, color: Color(0xFF9F7F88)),
                title: const Text('Credit Card'),
                trailing: TextButton(
                  onPressed: () {
                    showPaymentBottomSheet(context, "Credit Card");
                  },
                  child: const Text('Select'),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: const Text('Bkash Payment'),
                trailing: TextButton(
                  onPressed: () {
                    showPaymentBottomSheet(context, "Bkash");
                  },
                  child: const Text('Select'),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: const Text('Nagad Payment'),
                trailing: TextButton(
                  onPressed: () {
                    showPaymentBottomSheet(context, "Nagad");
                  },
                  child: const Text('Select'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Order Summary',
              style: TextStyle(
                  color: Color(0xFF9F7F88),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Obx(
                  () => Card(
                elevation: 5,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Subtotal'),
                      trailing: Text('৳${cartController.subtotal.toStringAsFixed(2)}'),
                    ),
                    ListTile(
                      title: const Text('Discount'),
                      trailing: Text('৳$discount'),
                    ),
                    ListTile(
                      title: const Text('Shipping'),
                      trailing: Text('৳$shipping'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
                  () => Card(
                elevation: 5,
                child: ListTile(
                  title: const Text('Total'),
                  trailing: Text('৳${(cartController.subtotal + discount + shipping).toStringAsFixed(2)}'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  cartController.placeOrder(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderConfirmScreen(),
                    ),
                  );
                },
                child: const Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}