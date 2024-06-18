import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:super_app_telemedicine/domain/entity/review.dart';

Widget reviewCard(Review review) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                review.user,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                review.tanggal != null
                    ? DateFormat('dd-MM-yyyy')
                        .format(DateFormat('dd-MM-yyyy').parse(review.tanggal!))
                    : '',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                size: 16,
                color: index < review.rating ? Colors.orange : Colors.grey[300],
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            review.review,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }