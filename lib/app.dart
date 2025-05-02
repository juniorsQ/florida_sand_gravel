import 'package:florida_sand_gravel/features/auth/data/repositories/register_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florida_sand_gravel/features/auth/presentation/screens/login_screen.dart';
import 'package:florida_sand_gravel/features/auth/presentation/screens/register_screen.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/login/login_cubit.dart';

import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/presentation/cubits/register/register_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(authRepository: AuthRepository()), //inyectar dependencias si las hay en este caso son los Repositories que vamos a necesitar JuniorsQ
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(registerRepository:RegisterRepository()), // inyectar dependencias repositories JuniorsQ
        ),
      ],
      child: MaterialApp(
        title: 'Florida Sand & Gravel',
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