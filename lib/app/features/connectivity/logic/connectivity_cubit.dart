import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_cubit.freezed.dart';
part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(const ConnectivityState.initial());
  bool get willReconnected => state != const ConnectivityState.initial();

  Future<void> get subscribeToConnectivityState async {
    // Connectivity().onConnectivityChanged.listen(
    //   (List<ConnectivityResult> result) async {
    //     return switch (result) {
    //       ConnectivityResult.wifi => emit(await _event),
    //       ConnectivityResult.mobile => emit(await _event),
    //       _ => emit(
    //           const ConnectivityState.disconnected(),
    //         )
    //     };
    //   },
    // );
  }

  Future<ConnectivityState> get _event async {
    return !(await canLookupBackend)
        ? willReconnected
            ? const ConnectivityState.reconnected()
            : const ConnectivityState.connected()
        : const ConnectivityState.disconnected();
  }

  Future<bool> get canLookupBackend async {
    try {
      final result = await InternetAddress.lookup(
        dotenv.get('ECOCAASITECH_BACKEND_BASE_URL'),
      );
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
