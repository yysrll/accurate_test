import 'package:accurate_test/component/custom_text_field.dart';
import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/di/service_locator.dart';
import 'package:accurate_test/features/user/bloc/create_user/create_user_bloc.dart';
import 'package:accurate_test/features/user/bloc/user_bloc.dart';
import 'package:accurate_test/utils/string_extension.dart';
import 'package:accurate_test/utils/string_resource.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUserButton extends StatelessWidget {
  const CreateUserButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showCreateUserBottomSheet(context, onCreated: (user) {
          context.read<UserBloc>().add(UserCreated(user));
        });
      },
      icon: const Icon(
        Icons.add,
        size: 28,
      ),
    );
  }

  void showCreateUserBottomSheet(
    BuildContext context, {
    required void Function(UserModel) onCreated,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CreateUserBottomSheet(onCreated: onCreated);
      },
    );
  }
}

class CreateUserBottomSheet extends StatefulWidget {
  final void Function(UserModel) onCreated;

  const CreateUserBottomSheet({
    super.key,
    required this.onCreated,
  });

  @override
  State<CreateUserBottomSheet> createState() => _CreateUserBottomSheetState();
}

class _CreateUserBottomSheetState extends State<CreateUserBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom + 32,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: _nameController,
              label: const Text(StringResource.labelName),
              prefixIcon: const Icon(Icons.person),
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return StringResource.cantBeEmpty;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _addressController,
              label: const Text(StringResource.labelAddress),
              prefixIcon: const Icon(Icons.location_on),
              validator: (address) {
                if (address == null || address.isEmpty) {
                  return StringResource.cantBeEmpty;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _emailController,
              label: const Text(StringResource.labelEmail),
              prefixIcon: const Icon(Icons.email),
              validator: (email) {
                if (email == null || email.isEmpty) {
                  return StringResource.cantBeEmpty;
                }
                if (!email.isValidEmail()) {
                  return StringResource.invalidEmail;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _phoneController,
              label: const Text(StringResource.labelPhone),
              prefixIcon: const Icon(Icons.phone),
              validator: (phone) {
                if (phone == null || phone.isEmpty) {
                  return StringResource.cantBeEmpty;
                }
                if (!phone.isValidPhoneNumber()) {
                  return StringResource.invalidPhone;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _cityController,
              label: const Text(StringResource.labelCity),
              prefixIcon: const Icon(Icons.location_city),
              validator: (city) {
                if (city == null || city.isEmpty) {
                  return StringResource.cantBeEmpty;
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            createButton(widget.onCreated),
          ],
        ),
      ),
    );
  }

  Widget createButton(void Function(UserModel) onCreated) {
    return BlocProvider(
      create: (_) => CreateUserBloc(getIt()),
      child: BlocConsumer<CreateUserBloc, CreateUserState>(
        listener: (context, state) {
          if (state is CreateUserSuccess) {
            onCreated(state.user);
            context.router.maybePop();
          }
        },
        listenWhen: (previous, current) {
          return previous is CreateUserSuccess && previous != current;
        },
        builder: (
          context,
          state,
        ) {
          if (state is CreateUserLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return Column(
            children: [
              if (state is CreateUserError)
                Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  final user = UserModel(
                    id: '',
                    name: _nameController.text.trim(),
                    address: _addressController.text.trim(),
                    email: _emailController.text.trim(),
                    phoneNumber: _phoneController.text.trim(),
                    city: _cityController.text.trim(),
                  );
                  context.read<CreateUserBloc>().add(CreatedUser(user));
                },
                child: const Text('Create'),
              ),
            ],
          );
        },
      ),
    );
  }
}
