import 'package:flutter/material.dart';
import '../models/food_vendor.dart';

class FoodVendorList extends StatelessWidget {
  final List<FoodVendor> vendors;
  final void Function(FoodVendor) onOrder;

  const FoodVendorList({
    super.key,
    required this.vendors,
    required this.onOrder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey("food"),
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: vendors.length,
        itemBuilder: (context, index) {
          final vendor = vendors[index];
          return Card(
            color: const Color(0xFF23233A),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(vendor.name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 6),
                  Text(vendor.type,
                      style: const TextStyle(fontSize: 13, color: Colors.white70)),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => onOrder(vendor),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Order Here"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
