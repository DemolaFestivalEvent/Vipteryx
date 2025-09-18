import 'package:flutter/material.dart';

class FriendMarker extends StatefulWidget {
  final String name;
  final VoidCallback onTap;

  const FriendMarker({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  State<FriendMarker> createState() => _FriendMarkerState();
}

class _FriendMarkerState extends State<FriendMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.8,
      upperBound: 1.2,
      value: 1.0,
    );
  }

  void _animate() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onTap();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _controller,
      child: GestureDetector(
        onTap: _animate,
        child: Column(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.blueAccent,
              child: Text(
                widget.name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.name,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
