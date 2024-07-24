import 'package:accurate_test/core/domain/use_case/user_use_case.dart';
import 'package:accurate_test/di/service_locator.dart';
import 'package:accurate_test/features/city/bloc/city_bloc.dart';
import 'package:accurate_test/features/user/bloc/user_bloc.dart';
import 'package:accurate_test/features/city/widgets/city_modal_botttomsheet.dart';
import 'package:accurate_test/utils/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationFilter extends StatelessWidget {
  const LocationFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (ctx, state) {
      return InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.8,
                child: BlocProvider(
                  create: (context) => CityBloc(getIt(), getIt())
                    ..add(
                      const CityFetched(),
                    ),
                  child: CityModalBottomSheet(
                    onSelectedCity: (city) {
                      ctx.read<UserBloc>().add(
                            UserFetched(
                              param: UserParamUseCase(city: city.name),
                            ),
                          );
                      Navigator.pop(context);
                    },
                    onReset: () {
                      ctx.read<UserBloc>().add(
                            UserFetched(
                              param: UserParamUseCase(city: ''),
                            ),
                          );
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: backgroundColor(state.city),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_city,
                color: foregroundColor(state.city),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                StringResource.location,
                style: TextStyle(color: foregroundColor(state.city)),
              ),
              const SizedBox(width: 4),
              Text(
                state.city ?? StringResource.all,
                style: TextStyle(color: foregroundColor(state.city)),
              ),
            ],
          ),
        ),
      );
    });
  }

  Color backgroundColor(String? city) {
    if (city == null || city.isEmpty) {
      return Colors.grey.shade200;
    }
    return Colors.green;
  }

  Color? foregroundColor(String? city) {
    if (city == null || city.isEmpty) {
      return null;
    }
    return Colors.white;
  }
}
