import 'package:accurate_test/features/city/widgets/location_filter.dart';
import 'package:accurate_test/features/user/widgets/sorting_filter.dart';
import 'package:flutter/material.dart';

class UserFilter extends StatelessWidget {
  const UserFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LocationFilter(),
            SizedBox(width: 16),
            SortingFilter(),
          ],
        ),
      ],
    );
  }
}
