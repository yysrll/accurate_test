import 'package:flutter/material.dart';

class LocationFilter extends StatelessWidget {
  const LocationFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_city,
            color: Colors.grey,
            size: 20,
          ),
          SizedBox(width: 8),
          Text('Location: All'),
        ],
      ),
    );
  }
}
