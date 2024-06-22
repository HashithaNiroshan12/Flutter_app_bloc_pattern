// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatelessWidget {
//   const MapScreen({super.key, required this.longitude, required this.latitude});

//   final String longitude;
//   final String latitude;

//   @override
//   Widget build(BuildContext context) {
//     final double? lat = double.tryParse(latitude);
//     final double? lon = double.tryParse(longitude);
    
//     if (lat == null || lon == null) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.greenAccent[200],
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: const Center(
//             child: Text('Map'),
//           ),
//         ),
//         body: const Center(
//           child: Text('Invalid latitude or longitude values.'),
//         ),
//       );
//     }

//     final LatLng position = LatLng(lat, lon);
//     debugPrint("position: $position");

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.greenAccent[200],
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Center(
//           child: Text('Map'),
//         ),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: position,
//           zoom: 10.0,
//         ),
//         markers: {
//           Marker(
//             markerId: const MarkerId('selected-location'),
//             position: position,
//             infoWindow: InfoWindow(
//               title: 'Selected Location',
//               snippet: '$latitude, $longitude',
//             ),
//           ),
//         },
//       ),
//     );
//   }
// }
