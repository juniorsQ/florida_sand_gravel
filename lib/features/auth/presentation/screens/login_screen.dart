import 'package:florida_sand_gravel/features/auth/presentation/cubits/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/login/login_cubit.dart';

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
      appBar: AppBar(
        title: const Text("Iniciar Sesión"), // 🔹 Título de la pantalla
      ),
      body: BlocConsumer<LoginCubit, LoginState>( // 🔄 Usamos BlocConsumer para escuchar cambios de estado
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar( // 🔔 Mensaje de error
              SnackBar(content: Text(state.error)),
            );
          }
        },
builder: (context, state) {
  if (state is LoginLoading) {
    return const Center(child: CircularProgressIndicator()); // ⏳ Solo mientras el login está en proceso
  } else if (state is LoginSuccess) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 80), // ✅ Ícono de éxito
          const SizedBox(height: 16),
          Text(
            "¡Bienvenido, ${state.authResponse.user.name}!", // ✅ Mostrar mensaje de éxito
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home'); // 🔹 Navegamos a la pantalla principal
            },
            child: const Text("Ir a la App"),
          ),
        ],
      ),
    ); // ✅ Mostramos mensaje de éxito en lugar del loader
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
            context.read<LoginCubit>().execute(
              _emailController.text, _passwordController.text,
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
}
      ),
    );
  }
}