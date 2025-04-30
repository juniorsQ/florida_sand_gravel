import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // Navegar a la pantalla principal
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Inicio de sesión exitoso')),
            );
            Navigator.pushReplacementNamed(context, '/home'); // Ejemplo de navegación
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error al iniciar sesión: ${state.error}')),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Correo Electrónico'),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginCubit>().login(
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  child: const Text('Iniciar Sesión'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('¿No tienes cuenta? Regístrate'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}