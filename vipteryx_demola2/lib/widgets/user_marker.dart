import 'package:flutter/material.dart';

class UserMarker extends StatelessWidget {
  const UserMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: const Icon(Icons.person_pin_circle, size: 18, color: Colors.white),
    );
  }
}
