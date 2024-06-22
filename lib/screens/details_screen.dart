import 'package:flutter/material.dart';
import 'package:test_code_flutter_fire/models/hotels.dart';
import 'package:test_code_flutter_fire/shared/widgets/location_map.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.e});

  final Hotel e;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[200],
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Details',
            style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                fontSize: 24),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationMap(
                            title: e.title,
                            address: e.address,
                          )));
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //     builder: (context) =>   MapScreen(
              //           longitude: e.longitude,
              //           latitude: e.latitude,
              //         )));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/profile.jpg',
                  image: e.image['small'] ?? '',
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/profile.jpg',
                        fit: BoxFit.cover);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              e.title,
               style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              e.description,
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.outline,
                fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
