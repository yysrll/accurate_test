import 'package:accurate_test/features/user/user_provider.dart';
import 'package:accurate_test/utils/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context.read<UserProvider>().name,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: StringResource.hintSearch,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: (value) {
        context.read<UserProvider>().name = value;
      },
    );
  }
}
