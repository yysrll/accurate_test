import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/features/user/widgets/search_field.dart';
import 'package:accurate_test/features/user/widgets/user_list.dart';
import 'package:flutter/material.dart';

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
              Expanded(
                child: UserList(
                  users: List.generate(
                    10,
                    (index) => UserModel(
                      id: 'id',
                      name: 'John Doe $index',
                      address: 'address jalanan',
                      email: 'johndoe@email.com',
                      phoneNumber: '08103927',
                      city: 'Jakarta Pusat',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
