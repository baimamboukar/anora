import 'package:anora/app/features/auth/data/models/organization_model.dart';
import 'package:anora/app/features/auth/data/models/user_model.dart';
import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension AuthX on BuildContext {
  AnoraUser? get user => read<AuthCubit>().state.maybeWhen(
        authenticated: (user) => user,
        orElse: () => null,
      );

  UserOrganization? get org => read<AuthCubit>().state.maybeWhen(
        authenticated: (user) => user.organizations.firstOrNull,
        orElse: () => null,
      );
}
