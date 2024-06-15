import 'package:flutter/material.dart';

Widget searchBar() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.black54),
          SizedBox(width: 8),
          Text(
            'Cari dokter, spesialis atau gejala',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    ),
  );
}
