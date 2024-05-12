part of 'connectivity_cubit.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState.initial() = _Initial;
  const factory ConnectivityState.checking() = _Checking;
  const factory ConnectivityState.connected() = _Connected;
  const factory ConnectivityState.reconnected() = _Reconnected;
  const factory ConnectivityState.disconnected() = _Disconnected;
}
