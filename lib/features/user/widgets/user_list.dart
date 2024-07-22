import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/features/user/widgets/user_item.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<UserModel> users;

  const UserList({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return emptyWidget(context);
    }
    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        final user = users[index];
        return UserItem(user: user);
      },
    );
  }

  Widget emptyWidget(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        const Icon(
          Icons.folder_off_outlined,
          size: 100,
        ),
        Text(
          'Opps',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Data not found',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
