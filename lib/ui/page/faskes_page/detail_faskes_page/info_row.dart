import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPreview extends StatelessWidget {
  final double latitude;
  final double longitude;

  const MapPreview({required this.latitude, required this.longitude});

  Future<void> _openMap() async {
    final String googleMapsUrl = 'comgooglemaps://?q=$latitude,$longitude';
    final String appleMapsUrl =
        'https://maps.apple.com/?q=$latitude,$longitude';

    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl),
          mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(Uri.parse(appleMapsUrl))) {
      await launchUrl(Uri.parse(appleMapsUrl),
          mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch maps';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longitude),
                zoom: 15.5,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('location'),
                  position: LatLng(latitude, longitude),
                ),
              },
              zoomControlsEnabled: false,
              scrollGesturesEnabled: false,
              rotateGesturesEnabled: false,
              tiltGesturesEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              mapToolbarEnabled: false,
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                log('open map');
                _openMap();
              },
            ),
          ),
        ),
      ],
    );
  }
}

Widget infoRow(String title, String value, double latitude, double longitude) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 380,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[400]!),
                ),
              ),
              child: Text(
                title,
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(width: 16),
                MapPreview(latitude: latitude, longitude: longitude),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
