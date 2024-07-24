import 'package:accurate_test/component/custom_text_field.dart';
import 'package:accurate_test/features/user/user_provider.dart';
import 'package:accurate_test/utils/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchUserField extends StatelessWidget {
  const SearchUserField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      initialValue: context.read<UserProvider>().name,
      hintText: StringResource.hintSearch,
      prefixIcon: const Icon(Icons.search),
      onChanged: (value) {
        context.read<UserProvider>().name = value;
      },
    );
  }
}
