import 'package:flutter/material.dart';

Widget buildActionButton(IconData icon, String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Icon(icon, size: 20, color: Colors.black),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget suggestedVideo(Color color, String title, IconData Icon_data) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12),
    child: Column(
      children: [
        Container(height: 220, width: double.infinity, color: color),
        const SizedBox(height: 8),
        Row(
          children: [
            CircleAvatar(radius: 20, child: Icon(Icon_data)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const Icon(Icons.more_vert),
          ],
        ),
      ],
    ),
  );
}
