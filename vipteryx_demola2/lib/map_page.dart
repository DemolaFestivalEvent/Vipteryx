import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// import your custom marker widgets
import '../widgets/festival_marker.dart';
import '../widgets/friend_marker.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  static const LatLng _center = LatLng(65.02147, 25.45964);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();

  final LatLngBounds _festivalBounds = LatLngBounds(
    LatLng(65.02040, 25.45433), // southwest
    LatLng( 65.02321, 25.46362), // northeast
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
               
                initialCameraFit: CameraFit.bounds(
                  bounds: _festivalBounds,
                  padding: const EdgeInsets.all(24),
                  minZoom: 15,
                  maxZoom: 18,
                ),
                cameraConstraint: CameraConstraint.contain(bounds: _festivalBounds),
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.yourapp',
                ),

                MarkerLayer(
                  markers: [
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("🎶 Main Stage tapped!")),
                          );
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("👋 You found Alex!")),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
