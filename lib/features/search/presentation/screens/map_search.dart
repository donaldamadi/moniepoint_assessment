import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moniepoint_assessment/features/search/presentation/widgets/animated_floating_buttons.dart';
import 'package:moniepoint_assessment/features/search/presentation/widgets/animated_search_bar.dart';
import 'package:moniepoint_assessment/features/search/presentation/widgets/animated_variant_list.dart';

class MapSearchPage extends StatefulWidget {
  const MapSearchPage({super.key});

  @override
  _MapSearchPageState createState() => _MapSearchPageState();
}

class _MapSearchPageState extends State<MapSearchPage> with SingleTickerProviderStateMixin {
  late GoogleMapController mapController;
  final LatLng _lagosCenter = const LatLng(6.5244, 3.3792); // Coordinates for Lagos, Nigeria
  final Set<Marker> _markers = {};
  String darkMapStyle = '';

  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    loadMapStyles();
    _setMarkers();
    _controller.forward();
  }

  /// Initializes the animation controller and animations for opacity and position.
  void _initializeAnimations() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _positionAnimation = Tween<double>(begin: -100, end: 60).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  /// Loads the dark map style from the assets.
  Future<void> loadMapStyles() async {
    try {
      darkMapStyle = await rootBundle.loadString('assets/map_styles/dark.json');
    } catch (e) {
      print("Error loading map style: $e");
    }
  }

  /// Sets up the markers on the map with staggered animations.
  void _setMarkers() {
    final markerData = [
      {'id': 'Marker1', 'lat': 6.5244, 'lng': 3.3792, 'price': '₦13.3 mn', 'delay': 500},
      {'id': 'Marker2', 'lat': 6.5295, 'lng': 3.3679, 'price': '₦11 mn', 'delay': 1000},
      {'id': 'Marker3', 'lat': 6.5190, 'lng': 3.3846, 'price': '₦10.3 mn', 'delay': 1500},
      {'id': 'Marker4', 'lat': 6.5240, 'lng': 3.3926, 'price': '₦8.5 mn', 'delay': 2000},
      {'id': 'Marker5', 'lat': 6.5270, 'lng': 3.3720, 'price': '₦7.8 mn', 'delay': 2500},
      {'id': 'Marker6', 'lat': 6.5200, 'lng': 3.3820, 'price': '₦6.95 mn', 'delay': 3000},
    ];

    for (var marker in markerData) {
      _createAnimatedMarker(
        marker['id'] as String,
        marker['lat'] as double,
        marker['lng'] as double,
        marker['price'] as String,
        delay: marker['delay'] as int,
      );
    }
  }

  /// Creates an animated marker on the map that appears after a delay.
  void _createAnimatedMarker(String id, double lat, double lng, String price, {int delay = 0}) {
    Future.delayed(Duration(milliseconds: delay), () {
      setState(() {
        _markers.add(Marker(
          markerId: MarkerId(id),
          position: LatLng(lat, lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          infoWindow: InfoWindow(title: price),
        ));
      });
    });
  }

  /// Applies the map style when the map is created.
  void _applyMapStyle(GoogleMapController controller) {
    mapController = controller;
    try {
      mapController.setMapStyle(darkMapStyle);
    } catch (e) {
      print("Failed to apply map style: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _lagosCenter,
              zoom: 14.0,
            ),
            markers: _markers,
            mapType: MapType.normal,
            onMapCreated: _applyMapStyle,
          ),
          AnimatedSearchBar(
            positionAnimation: _positionAnimation,
            opacityAnimation: _opacityAnimation,
          ),
          AnimatedFloatingButtons(
            opacityAnimation: _opacityAnimation,
          ),
          AnimatedVariantListFloatingButton(
            opacityAnimation: _opacityAnimation,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
