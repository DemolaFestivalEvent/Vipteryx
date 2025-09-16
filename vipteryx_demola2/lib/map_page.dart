import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  static const LatLng _center = LatLng(65.02147, 25.45964); // Kuusisaari

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Explore the Festival Grounds',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Stack(
                children: [
                  FlutterMap(
                    options: const MapOptions(
                      center: _center,
                      zoom: 15,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                        userAgentPackageName: 'com.example.vipteryx_demola2',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 40.0,
                            height: 40.0,
                            point: _center,
                            child: Icon(Icons.location_on, color: Colors.red, size: 40),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Search bar overlay
                  Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(24),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search location or stage...',
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}