import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// Services
import '../services/location_service.dart';
import '../services/navigation_service.dart';

// import  custom marker widgets
import '../widgets/festival_marker.dart';
import '../widgets/friend_marker.dart';
import '../widgets/user_marker.dart';
import '../widgets/stage_card.dart';
import '../widgets/food_vendor_list.dart';

import '../models/food_vendor.dart';


class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  static const LatLng _center = LatLng(65.02147, 25.45964);
  
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  final MapController _mapController = MapController();

  LatLng? _userLocation;
  String? _selectedStage;
  bool _showFoodOptions = false;

  final LatLngBounds _festivalBounds = LatLngBounds(
    LatLng(65.019231, 25.452068), // southwest
    LatLng(65.024160, 25.464593), // northeast
  );

  final List<FoodVendor> _foodVendors = [
  FoodVendor(
    id: "pizza",
    name: "Festival Pizza",
    location: LatLng(65.0219, 25.4601),
    type: "Food",
  ),
  FoodVendor(
    id: "drinks",
    name: "Chill Bar",
    location: LatLng(65.0221, 25.4590),
    type: "Drinks",
  ),
  FoodVendor(
    id: "tacos",
    name: "Taco Truck",
    location: LatLng(65.0216, 25.4612),
    type: "Food",
  ),
];

  @override
  Widget build(BuildContext context) {
    final Color background = const Color(0xFF181828);
    final Color cardColor = const Color(0xFF23233A);
    final Color accent = Colors.redAccent;
    final Color textColor = Colors.white;
    final Color subTextColor = Colors.white70;

    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //  Header row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Festival Map",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                        ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                    ),
                  ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    final loc = await LocationService.getCurrentLocation();
                    if (loc != null) {
                      setState(() => _userLocation = loc);
                      _mapController.move(loc, 18); // recenters map
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("⚠️ Location unavailable")),
                      );
                    }
                  },
                  icon: const Icon(Icons.my_location, size: 16),
                  label: const Text("My Location"),
                ),
                ],
              ),
              const SizedBox(height: 12),

              //  Map inside a card
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        initialCenter: MapPage._center,
                        initialZoom: 18,
                        minZoom: 10,
                        maxZoom: 30,
                        cameraConstraint:CameraConstraint.contain(bounds: _festivalBounds),
                          onTap: (_, __) {
                          setState(() {
                            _selectedStage = null;
                            _showFoodOptions = false;
                          });
                        },
                      ),
                      
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: const ['a', 'b', 'c'],
                          userAgentPackageName: 'com.example.yourapp',
                        ),
                        MarkerLayer(
                          markers: [
                            if (_userLocation != null)
                              Marker(
                                point: _userLocation!,
                                child: const UserMarker(),
                              ),
                            Marker(
                              width: 100,
                              height: 100,
                              point: const LatLng(65.0215, 25.4598),
                              child: FestivalMarker(
                                title: "Main Stage",
                                crowdLevel: "High",
                                color: Colors.red,
                                icon: Icons.music_note,
                                onTap: () {
                                  setState(() => _selectedStage = "Main Stage");
                                  _showFoodOptions = false;
                                },
                              ),
                            ),
                            Marker(
                              width: 80,
                              height: 80,
                              point: const LatLng(65.0217, 25.4599),
                              child: FriendMarker(
                                name: "Alex",
                                onTap: () {
                                },
                              ),
                            ),
                           ..._foodVendors.map((vendor) => Marker(
                                point: vendor.location,
                                width: 60,
                                height: 60,
                                child: Icon(Icons.restaurant, color: Colors.orange, size: 30),
                              )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              //  Quick action buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                    setState(() {
                      _showFoodOptions = !_showFoodOptions;
                      _selectedStage = null; 
                    });
                  },
                    icon: const Icon(Icons.flash_on, size: 16),
                    label: const Text("Quick Order"),
                  ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.people, size: 16),
                      label: const Text("Find Friends"),
                    ),
                  ),
                ],
              ),

              // STAGE AND FOOD CARDS
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              child: _selectedStage != null
                  ? StageCard(
                      stageName: _selectedStage!,
                      onDirections: () {},
                      onSchedule: () {},
                    )
                  : _showFoodOptions
                      ? FoodVendorList(
                          vendors: _foodVendors,
                          onOrder: (vendor) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Ordering from ${vendor.name}")),
                            );
                          },
                        )
                      : const SizedBox.shrink(),
            ),
],
          ),
        ),
      ),
    );
  }
}
