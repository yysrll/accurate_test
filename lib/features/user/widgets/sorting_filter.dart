import 'package:accurate_test/features/user/bloc/user_bloc.dart';
import 'package:accurate_test/features/user/utils/user_sorter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortingFilter extends StatelessWidget {
  const SortingFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return InkWell(
        onTap: () {
          context.read<UserBloc>().add(const UserSorted());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: backgroundColor(state.sort),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon(state.sort),
                color: foregroundColor(state.sort),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Sort',
                style: TextStyle(color: foregroundColor(state.sort)),
              ),
            ],
          ),
        ),
      );
    });
  }

  Color backgroundColor(Sorting sort) {
    switch (sort) {
      case Sorting.asc:
      case Sorting.desc:
        return Colors.green;
      default:
        return Colors.grey.shade200;
    }
  }

  Color? foregroundColor(Sorting sort) {
    switch (sort) {
      case Sorting.asc:
      case Sorting.desc:
        return Colors.white;
      default:
        return null;
    }
  }

  IconData icon(Sorting sort) {
    switch (sort) {
      case Sorting.asc:
        return Icons.arrow_upward;
      case Sorting.desc:
        return Icons.arrow_downward;
      default:
        return Icons.sort;
    }
  }
}
