import 'package:flutter/material.dart';
import 'package:loop_wear/order_confirm_screen.dart';
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF9F7F88),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('My Cart',style: TextStyle(color: Colors.white,fontFamily: 'Philosopher',fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery Address',
              style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.location_on,color: Color(0xFF9F7F88),),
                title: const Text('Mirpur 2',style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18,fontFamily: 'Philosopher',fontWeight: FontWeight.bold),),
                subtitle: const Text('Rupnagar, Dhaka, Bangladesh',style: TextStyle(color: Color(0xFF9F7F88),fontSize: 15,fontFamily: 'Philosopher',fontWeight: FontWeight.bold),),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('Change',style: TextStyle(color: Color(0xFF9F7F88),fontFamily: 'Philosopher',fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Payment Method',
              style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.payment,color: Color(0xFF9F7F88),),
                title: const Text('Credit Card' ,style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),),

                trailing: TextButton(
                  onPressed: () {
                    showPaymentBottomSheet(context, "Credit Card");
                  },
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      color: Color(0xFF9F7F88),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              child: ListTile(
                leading: Image.asset(
                  'assets/images/bkash.png',
                  height: 30,
                  width: 30,
                ),
                title: const Text('Bkash Payment', style: TextStyle(color: Color(0xFF9F7F88), fontWeight: FontWeight.bold),),

                trailing: TextButton(
                  onPressed: () {
                    showPaymentBottomSheet(context, "Bkash");
                  },
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      color: Color(0xFF9F7F88),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              child: ListTile(
                leading: Image.asset(
                  'assets/images/nagod.png',
                  height: 30,
                  width: 30,
                ),
                title: const Text('Nagod Payment', style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),),

                trailing: TextButton(
                  onPressed: () {
                    showPaymentBottomSheet(context, "Nagad");
                  },
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      color: Color(0xFF9F7F88),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),


            // Cart Summary
            const Text(
              'Cart Summary',
              style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Item 1', style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),),
                    subtitle: const Text('Quantity: 2', style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),),
                    trailing: const Text('৳200', style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                 // const Divider(),
                  const SizedBox(height: 8),
                  ListTile(
                    title: const Text('Item 2', style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),),
                    subtitle: const Text('Quantity: 1', style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),),
                    trailing: const Text('৳150', style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Total Price
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              child: ListTile(
                title: const Text(
                  'Total',
                  style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: const Text(
                  '৳350',
                  style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24),


            SizedBox(

              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderConfirmScreen ()),
                  );
                },
                child: const Text(
                  'Place Order',
                  style: TextStyle(color: Color(0xFF9F7F88),fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void showPaymentBottomSheet(BuildContext context, String method) {

  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
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
              "Payment",
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