import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color background = const Color(0xFF181828);
    final Color cardColor = const Color(0xFF23233A);
    final Color accent = Colors.redAccent;
    final Color textColor = Colors.white;
    final Color subTextColor = Colors.white70;

    return Container(
      color: background,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          // Hero Banner
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [accent, Colors.deepPurple.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Festival Companion",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Your personalized guide to the best festival experience",
                  style: TextStyle(
                    color: subTextColor,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: accent,
                  ),
                  onPressed: () {},
                  child: const Text("Explore Now"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          // Upcoming Events
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upcoming Events",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: accent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          _EventCard(
            image: "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80",
            title: "Ostock",
            date: "July 25-27, 2023",
            location: "Helsinki, Finland",
            cardColor: cardColor,
            textColor: textColor,
            subTextColor: subTextColor,
          ),
          _EventCard(
            image: "https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80",
            title: "Vectorama",
            date: "June 6-8, 2023",
            location: "Oulu, Finland",
            cardColor: cardColor,
            textColor: textColor,
            subTextColor: subTextColor,
          ),
          _EventCard(
            image: "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?auto=format&fit=crop&w=400&q=80",
            title: "Blockfest",
            date: "August 19-20, 2023",
            location: "Tampere, Finland",
            cardColor: cardColor,
            textColor: textColor,
            subTextColor: subTextColor,
          ),
          const SizedBox(height: 28),
          // Connect Services
          Text(
            "Connect Your Services",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.4,
            children: [
              _ServiceCard(
                icon: Icons.music_note,
                title: "Music Services",
                subtitle: "Get personalized artist recommendations",
                color: cardColor,
                iconColor: accent,
                textColor: textColor,
                subTextColor: subTextColor,
              ),
              _ServiceCard(
                icon: Icons.favorite_border,
                title: "Health Apps",
                subtitle: "Food & drink suggestions based on your health",
                color: cardColor,
                iconColor: Colors.pinkAccent,
                textColor: textColor,
                subTextColor: subTextColor,
              ),
              _ServiceCard(
                icon: Icons.payment,
                title: "Payment Methods",
                subtitle: "Seamless payments throughout the venue",
                color: cardColor,
                iconColor: Colors.lightBlueAccent,
                textColor: textColor,
                subTextColor: subTextColor,
              ),
              _ServiceCard(
                icon: Icons.map_outlined,
                title: "Real-time Map",
                subtitle: "Never get lost at the venue",
                color: cardColor,
                iconColor: accent,
                textColor: textColor,
                subTextColor: subTextColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String location;
  final Color cardColor;
  final Color textColor;
  final Color subTextColor;

  const _EventCard({
    required this.image,
    required this.title,
    required this.date,
    required this.location,
    required this.cardColor,
    required this.textColor,
    required this.subTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.network(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 14, color: subTextColor),
                      const SizedBox(width: 4),
                      Text(date, style: TextStyle(color: subTextColor, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: subTextColor),
                      const SizedBox(width: 4),
                      Text(location, style: TextStyle(color: subTextColor, fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Color iconColor;
  final Color textColor;
  final Color subTextColor;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.iconColor,
    required this.textColor,
    required this.subTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: subTextColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}