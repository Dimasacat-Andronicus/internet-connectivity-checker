part of 'connectivity_info_cubit.dart';

enum ConnectivityInfoStatus {
  connecting,
  wifi,
  wifinot,
  mobile,
  mobilenot,
  none,
}

class ConnectivityInfoState {
  final ConnectivityInfoStatus status;

  const ConnectivityInfoState(this.status);

  Map<String, dynamic> get displayInfo {
    switch (status) {
      case ConnectivityInfoStatus.wifi:
        return {
          'message': "Connected to WiFi with Internet Access",
          'icon': Icons.wifi,
        };

      case ConnectivityInfoStatus.wifinot:
        return {
          'message': "Connected to WiFi but no Internet Access",
          'icon': Icons.wifi_off,
        };

      case ConnectivityInfoStatus.mobile:
        return {
          'message': "Connected to Mobile Data with Internet Access",
          'icon': Icons.network_cell,
        };

      case ConnectivityInfoStatus.mobilenot:
        return {
          'message': "Connected to Mobile Data but no Internet Access",
          'icon': Icons.mobiledata_off,
        };

      case ConnectivityInfoStatus.connecting:
        return {'message': "Connecting...", 'icon': null};

      case ConnectivityInfoStatus.none:
        return {
          'message': "No Internet Connection",
          'icon': Icons.signal_wifi_off,
        };
    }
  }
}
