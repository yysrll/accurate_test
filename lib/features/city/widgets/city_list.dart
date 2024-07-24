import 'dart:math';

import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/features/city/bloc/city_bloc.dart';
import 'package:accurate_test/utils/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CityList extends StatelessWidget {
  final void Function(CityModel) onSelectedCity;
  const CityList({
    super.key,
    required this.onSelectedCity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
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

        final List<CityModel> cities = state.cities;
        if (cities.isEmpty) {
          return emptyWidget(context);
        }
        return ListView.separated(
          itemCount: cities.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemBuilder: (context, index) {
            final city = cities[index];
            return InkWell(
              onTap: () {
                onSelectedCity(city);
              },
              child: CityItem(city: city),
            );
          },
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
      itemCount: 24,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemBuilder: (context, index) {
        final city = CityModel(
          id: 'id',
          name: List.generate(2 + Random().nextInt(3), (index) => "index ")
              .toString(),
        );
        return Skeletonizer(child: CityItem(city: city));
      },
    );
  }
}

class CityItem extends StatelessWidget {
  final CityModel city;

  const CityItem({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      city.name,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
