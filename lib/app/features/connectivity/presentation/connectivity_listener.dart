// ignore_for_file: use_colored_box

import 'package:anora/app/features/connectivity/logic/connectivity_cubit.dart';
import 'package:anora/app/features/connectivity/presentation/offline_view.dart';
import 'package:anora/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityListener extends StatelessWidget {
  const ConnectivityListener({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectivityCubit, ConnectivityState>(
      buildWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          connected: () {},
          reconnected: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: context.colorScheme.primary,
                content: const Text(
                  'Reconnected!',
                ),
              ),
            );
          },
          disconnected: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: context.colorScheme.destructive,
                content: const Text(
                  'No connection',
                ),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => child,
          connected: () => child,
          disconnected: () => Stack(
            children: [
              AbsorbPointer(
                child: child,
              ),
              Container(
                color: Colors.grey.withOpacity(.55),
                child: const OfflineView(),
              ),
            ],
          ),
        );
      },
    );
  }
}
