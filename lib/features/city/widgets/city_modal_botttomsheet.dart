import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/features/city/bloc/city_bloc.dart';
import 'package:accurate_test/features/city/widgets/city_list.dart';
import 'package:accurate_test/utils/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocBuilder<CityBloc, CityState>(
        builder: (context, state) {
          return Column(
            children: [
              TextFormField(
                initialValue: state.name,
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
                  context.read<CityBloc>().add(CitySearched(value));
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
          );
        }
      ),
    );
  }
}
