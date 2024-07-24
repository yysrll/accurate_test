import 'package:accurate_test/component/custom_text_field.dart';
import 'package:accurate_test/features/user/bloc/user_bloc.dart';
import 'package:accurate_test/utils/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchUserField extends StatelessWidget {
  const SearchUserField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return CustomTextField(
        initialValue: state.name,
        hintText: StringResource.hintSearch,
        prefixIcon: const Icon(Icons.search),
        onChanged: (value) {
          context.read<UserBloc>().add(UserSearched(value));
        },
      );
    });
  }
}
