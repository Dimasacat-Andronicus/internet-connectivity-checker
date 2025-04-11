import 'package:flutter/material.dart';
import 'connectivity_info_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ConnectivityInfoCubit, ConnectivityInfoState>(
        builder: (context, state) {
          final displayInfo = state.displayInfo;
          final message = displayInfo['message'] as String;
          final icon = displayInfo['icon'] as IconData?;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.status == ConnectivityInfoStatus.connecting)
                    const CircularProgressIndicator.adaptive(),
                  if (state.status != ConnectivityInfoStatus.connecting &&
                      icon != null)
                    Icon(
                      icon,
                      size: 80,
                      color:
                          state.status == ConnectivityInfoStatus.wifi ||
                                  state.status == ConnectivityInfoStatus.mobile
                              ? Colors.indigo
                              : Colors.black12,
                    ),
                  const SizedBox(height: 30),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
