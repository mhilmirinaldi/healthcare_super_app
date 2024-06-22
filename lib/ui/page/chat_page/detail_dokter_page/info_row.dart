import 'package:flutter/material.dart';

Widget infoRow(String title, String value, String iconPath) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 35,
          height: 35,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(iconPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
          ],
        ),
      ],
    );
  }