import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'connectivity_info_state.dart';

class ConnectivityInfoCubit extends Cubit<ConnectivityInfoState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  ConnectivityInfoCubit()
    : super(ConnectivityInfoState(ConnectivityInfoStatus.connecting)) {
    _monitorConnectivity();
  }

  void _monitorConnectivity() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      results,
    ) async {
      emit(ConnectivityInfoState(ConnectivityInfoStatus.connecting));

      for (var result in results) {
        await _updateConnectivityStatus(result);
      }
    });
  }

  Future<void> _updateConnectivityStatus(ConnectivityResult result) async {
    emit(ConnectivityInfoState(ConnectivityInfoStatus.connecting));

    await Future.delayed(const Duration(seconds: 2));

    switch (result) {
      case ConnectivityResult.wifi:
        emit(
          ConnectivityInfoState(
            await _hasInternetAccess()
                ? ConnectivityInfoStatus.wifi
                : ConnectivityInfoStatus.wifinot,
          ),
        );
        break;

      case ConnectivityResult.mobile:
        emit(
          ConnectivityInfoState(
            await _hasInternetAccess()
                ? ConnectivityInfoStatus.mobile
                : ConnectivityInfoStatus.mobilenot,
          ),
        );
        break;

      case ConnectivityResult.none:
        emit(ConnectivityInfoState(ConnectivityInfoStatus.none));
        break;

      default:
        emit(ConnectivityInfoState(ConnectivityInfoStatus.none));
    }
  }

  Future<bool> _hasInternetAccess() async {
    return await InternetConnectionChecker().hasConnection;
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
