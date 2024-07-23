import 'package:accurate_test/di/service_locator.dart';
import 'package:accurate_test/features/user/user_provider.dart';
import 'package:accurate_test/features/user/widgets/search_field.dart';
import 'package:accurate_test/features/user/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ChangeNotifierProvider(
            create: (_) => UserProvider(getIt()),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: SearchField(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Expanded(
                  child: UserList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
