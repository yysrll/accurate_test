import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/features/user/bloc/user_bloc.dart';
import 'package:accurate_test/features/user/widgets/user_item.dart';
import 'package:accurate_test/utils/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserList extends StatelessWidget {
  const UserList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.status.isInitial) {
          return const SizedBox();
        }

        if (state.status.isLoading) {
          return loadingListWidget();
        }

        if (state.status.isFailure) {
          return errorWidget(
            context,
            state.message ?? StringResource.errorDefault,
          );
        }

        final List<UserModel> users = state.users;
        if (users.isEmpty) {
          return emptyWidget(context);
        }
        return RefreshIndicator.adaptive(
          onRefresh: () async {
            context.read<UserBloc>().add(const UserFetched());
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
    return Center(
      child: Column(
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
      ),
    );
  }

  Widget loadingListWidget() {
    return ListView.separated(
      itemCount: 8,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        return Skeletonizer(
          child: UserItem(user: UserModel.dummy()),
        );
      },
    );
  }
}
