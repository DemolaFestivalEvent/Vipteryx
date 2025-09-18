import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationService {
  static Future<void> openGoogleMaps(LatLng destination) async {
    final uri = Uri.parse(
      "https://www.google.com/maps/dir/?api=1&destination=${destination.latitude},${destination.longitude}&travelmode=walking",
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
