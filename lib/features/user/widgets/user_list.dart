import 'package:accurate_test/common/result.dart';
import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/features/user/user_provider.dart';
import 'package:accurate_test/features/user/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserList extends StatelessWidget {
  const UserList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, _) {
        if (provider.state is Initial) {
          return const SizedBox();
        }

        if (provider.state is Loading) {
          return loadingListWidget();
        }

        if (provider.state is Failed) {
          return errorWidget(
            context,
            (provider.state as Failed).message,
          );
        }

        final List<UserModel> users = (provider.state as Success).data;
        if (users.isEmpty) {
          return emptyWidget(context);
        }
        return RefreshIndicator.adaptive(
          onRefresh: () async {
            await provider.fetchUsers();
          },
          child: ListView.separated(
            itemCount: users.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (context, index) {
              final user = users[index];
              return UserItem(user: user);
            },
          ),
        );
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

  Widget errorWidget(BuildContext context, String message) {
    return Column(
      children: [
        const SizedBox(height: 32),
        const Icon(
          Icons.warning_amber_rounded,
          size: 100,
        ),
        Text(
          'Opps',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget loadingListWidget() {
    return ListView.separated(
      itemCount: 8,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        final user = UserModel(
          id: 'id',
          name: 'dummy name',
          address: 'dummy for address',
          email: 'dummy@email.com',
          phoneNumber: '08123567',
          city: 'dummy city',
        );
        return Skeletonizer(child: UserItem(user: user));
      },
    );
  }
}
