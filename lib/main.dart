import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/connectivity_info_connectivity_screen.dart';
import 'cubit/connectivity_info_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            'Connectivity Info',
            style: TextStyle(color: Colors.white70, fontSize: 24),
          ),
        ),
        body: BlocProvider(
          create: (context) => ConnectivityInfoCubit(),
          child: const ConnectivityScreen(),
        ),
      ),
    );
  }
}
