import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:florida_sand_gravel/features/auth/presentation/screens/login_screen.dart';
import 'package:florida_sand_gravel/features/auth/presentation/screens/register_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(), // Asegúrate de inyectar dependencias si las hay
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(), // Asegúrate de inyectar dependencias si las hay
        ),
      ],
      child: MaterialApp(
        title: 'Mi App Registro Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
        },
      ),
    );
  }
}