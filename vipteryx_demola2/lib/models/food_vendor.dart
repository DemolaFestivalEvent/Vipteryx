import 'package:latlong2/latlong.dart';

class FoodVendor {
  final String id;
  final String name;
  final LatLng location;
  final String type;

  FoodVendor({
    required this.id,
    required this.name,
    required this.location,
    required this.type,
  });
}