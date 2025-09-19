import 'package:flutter/material.dart';

class StageCard extends StatelessWidget {
  final String stageName;
  final VoidCallback onDirections;
  final VoidCallback onSchedule;

  const StageCard({
    Key? key,
    required this.stageName,
    required this.onDirections,
    required this.onSchedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: const ValueKey("stage"),
      color: const Color(0xFF23233A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(stageName,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple)),
            const SizedBox(height: 4),
            const Text(
              "Now playing: Electronic Dance Vibes • Next: Indie Rock Session",
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: onDirections,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Get Directions"),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: onSchedule,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Add to Schedule"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
