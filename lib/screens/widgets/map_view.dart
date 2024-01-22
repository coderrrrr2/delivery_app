import 'package:delivery_app/configuration_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidgets extends StatefulWidget {
  const MapWidgets({Key? key}) : super(key: key);

  @override
  State<MapWidgets> createState() => _MapWidgetsState();
}

class _MapWidgetsState extends State<MapWidgets> {
  static const LatLng sourceLocation = LatLng(6.605874, 3.349149);
  static const LatLng destination = LatLng(6.4999, 4.11667);
  List<LatLng> polyLineCoordinates = [];
  BitmapDescriptor? bitmapDescriptor;

  @override
  void initState() {
    super.initState();
    getPolyPoints();
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polyLineCoordinates.add(
          LatLng(
            point.latitude,
            point.longitude,
          ),
        );
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            polylines: {
              Polyline(
                polylineId: const PolylineId("route"),
                points: polyLineCoordinates,
              ),
            },
            initialCameraPosition:
                const CameraPosition(target: sourceLocation, zoom: 20.5),
            markers: {
              const Marker(
                markerId: MarkerId("Source"),
                position: sourceLocation,
              ),
              const Marker(
                  markerId: MarkerId("Destination"), position: destination),
            },
          ),
          // You can add other widgets on top of the map here
        ],
      ),
    );
  }
}
