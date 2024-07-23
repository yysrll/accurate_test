import 'package:accurate_test/common/result.dart';
import 'package:accurate_test/features/user/user_provider.dart';
import 'package:accurate_test/features/user/widgets/location_filter.dart';
import 'package:accurate_test/features/user/widgets/sorting_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserFilter extends StatelessWidget {
  const UserFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<UserProvider>().state;
    if (state is Success) {
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

    return const SizedBox();
  }
}
