import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travulla/cubit/app_cubit_states.dart';
import 'package:travulla/cubit/app_cubits.dart';
import 'package:travulla/pages/welcome_page/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (State is WelcomeState) {
          return WelcomePage();
        } else {
          return Container();
        }
      }),
    );
  }
}
