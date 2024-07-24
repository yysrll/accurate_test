import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/di/service_locator.dart';
import 'package:accurate_test/features/city/city_provider.dart';
import 'package:accurate_test/features/user/user_provider.dart';
import 'package:accurate_test/features/city/widgets/city_modal_botttomsheet.dart';
import 'package:accurate_test/utils/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationFilter extends StatelessWidget {
  const LocationFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.8,
              child: ChangeNotifierProvider(
                create: (context) => CityProvider(getIt(), getIt()),
                child: CityModalBottomSheet(
                  onSelectedCity: (city) {
                    userProvider.location = city;
                    Navigator.pop(context);
                  },
                  onReset: () {
                    userProvider.location = null;
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
          color: backgroundColor(userProvider.location),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_city,
              color: foregroundColor(userProvider.location),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              StringResource.location,
              style: TextStyle(color: foregroundColor(userProvider.location)),
            ),
            const SizedBox(width: 4),
            Text(
              userProvider.location?.name ?? StringResource.all,
              style: TextStyle(color: foregroundColor(userProvider.location)),
            ),
          ],
        ),
      ),
    );
  }

  Color backgroundColor(CityModel? city) {
    if (city == null) {
      return Colors.grey.shade200;
    }
    return Colors.green;
  }

  Color? foregroundColor(CityModel? city) {
    if (city != null) {
      return Colors.white;
    }
    return null;
  }
}
