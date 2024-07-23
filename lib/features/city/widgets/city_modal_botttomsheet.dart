import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/features/city/city_provider.dart';
import 'package:accurate_test/features/city/widgets/city_list.dart';
import 'package:accurate_test/utils/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityModalBottomSheet extends StatelessWidget {
  final void Function(CityModel) onSelectedCity;
  final VoidCallback onReset;

  const CityModalBottomSheet({
    super.key,
    required this.onSelectedCity,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        children: [
          TextFormField(
            initialValue: context.read<CityProvider>().city,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: StringResource.hintLocationSearch,
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
              context.read<CityProvider>().city = value;
            },
          ),
          const SizedBox(height: 16),
          Expanded(child: CityList(onSelectedCity: onSelectedCity)),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: onReset,
            child: const Text(StringResource.reset),
          )
        ],
      ),
    );
  }
}
