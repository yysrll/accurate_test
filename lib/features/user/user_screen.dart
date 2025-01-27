import 'package:accurate_test/di/service_locator.dart';
import 'package:accurate_test/features/user/bloc/user_bloc.dart';
import 'package:accurate_test/features/user/widgets/create_user_button.dart';
import 'package:accurate_test/features/user/widgets/greeting.dart';
import 'package:accurate_test/features/user/widgets/search_user_field.dart';
import 'package:accurate_test/features/user/widgets/user_filter.dart';
import 'package:accurate_test/features/user/widgets/user_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
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
            child: BlocProvider(
              create: (context) => UserBloc(
                getIt(),
                getIt(),
                getIt(),
              )..add(const UserFetched()),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Greeting(),
                      Spacer(),
                      CreateUserButton(),
                    ],
                  ),
                  SearchUserField(),
                  UserFilter(),
                  SizedBox(height: 20),
                  Expanded(
                    child: UserList(),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
