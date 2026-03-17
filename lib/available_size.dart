import 'package:flutter/material.dart';

class AvailableSize extends StatefulWidget {

  const AvailableSize({super.key});

  @override
  State<AvailableSize> createState() => _AvailableSizeState();
}

class _AvailableSizeState extends State<AvailableSize> {
  int selectedSize = -1;
  List<String> size=['S','M','L','XL'];
  @override
  Widget build(BuildContext context) =>
      Row(
        children: List.generate(size.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSize = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 16),
                width: 40,
                height: 30,
                decoration: BoxDecoration(
                  color: selectedSize == index ? Color(0xFF9F7F88) : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Color(0xFF9F7F88)),
                ),
                child: Center(
                  child: Text(size[index], style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedSize == index ? Colors.white : Color(
                        0xFF9F7F88),
                    fontSize: 16,
                  )),
                ),
              ),
            );
          }),
      );
}