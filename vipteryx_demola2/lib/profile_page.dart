import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color background = const Color(0xFF181828);
    final Color cardColor = const Color(0xFF23233A);
    final Color iconColor = Colors.white70;
    final Color accent = Colors.redAccent;

    return Container(
      color: background,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          // Profile picture and name
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: cardColor,
                    child: Icon(Icons.person, size: 60, color: iconColor),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: accent,
                      child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "Festival Goer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
          // Profile options
          _ProfileCard(
            color: cardColor,
            icon: Icons.person,
            text: "Personal Information",
            iconColor: iconColor,
          ),
          _ProfileCard(
            color: cardColor,
            icon: Icons.settings,
            text: "Preferences",
            iconColor: iconColor,
          ),
          _ProfileCard(
            color: cardColor,
            icon: Icons.bookmark_border,
            text: "Saved events",
            iconColor: iconColor,
          ),
          _ProfileCard(
            color: cardColor,
            icon: Icons.link,
            text: "Connected apps",
            iconColor: iconColor,
          ),
          _ProfileCard(
            color: cardColor,
            icon: Icons.confirmation_num_outlined,
            text: "My tickets",
            iconColor: iconColor,
          ),
          _ProfileCard(
            color: cardColor,
            icon: Icons.settings_outlined,
            text: "Settings",
            iconColor: iconColor,
          ),
          const SizedBox(height: 24),
          // Friends section
          Text(
            "Friends",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          _ProfileCard(
            color: cardColor,
            icon: Icons.people_outline,
            text: "Manage Friends",
            iconColor: iconColor,
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Color iconColor;

  const _ProfileCard({
    required this.color,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white38),
        onTap: () {},
      ),
    );
  }
}