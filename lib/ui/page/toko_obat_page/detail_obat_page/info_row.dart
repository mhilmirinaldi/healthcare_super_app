import 'package:flutter/material.dart';

Widget infoRow(String title, String value, String? iconPath) {
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
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              softWrap: true,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    ],
  );
}
