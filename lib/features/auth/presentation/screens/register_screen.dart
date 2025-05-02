import 'package:florida_sand_gravel/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:florida_sand_gravel/features/auth/presentation/cubits/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _truckNumberController = TextEditingController();
  final _divisionController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('Solicitud de Acceso')),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Registro exitoso. ¡Inicia sesión ahora!')),
              );
              Navigator.pop(context);
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            if (state is RegisterLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTitle('Nombre'),
                      _buildTextField(_nameController, 'Ingrese su nombre'),

                      _buildTitle('Apellido'),
                      _buildTextField(_lastNameController, 'Ingrese su apellido'),

                      _buildTitle('Correo electrónico'),
                      _buildTextField(_emailController, 'ejemplo@email.com'),

                      _buildTitle('Número de teléfono'),
                      _buildTextField(_phoneController, '(000) 0000 0000'),

                      _buildTitle('Número de camión'),
                      _buildTextField(_truckNumberController, 'Ingrese el número de camión'),

                      _buildTitle('División de transporte'),
                      _buildDropdown(),

                      _buildTitle('Contraseña'),
                      _buildTextField(_passwordController, '********', isPassword: true),

                      _buildTitle('Repetir contraseña'),
                      _buildTextField(_repeatPasswordController, '********', isPassword: true),

                      const SizedBox(height: 20),
                      _buildSubmitButton(context),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('¿Ya tienes cuenta? Inicia sesión'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/terms');
                        },
                        child: const Text('Términos y condiciones'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(),
      ),
      obscureText: isPassword,
      validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
    );
  }

 String selectedDivision = "0"; //  Valor predeterminado

Widget _buildDropdown() {
  List<Map<String, dynamic>> divisions = [
    {"id": 0, "name": "Seleccione una división"},
    {"id": 1, "name": "División 1"},
    {"id": 2, "name": "División 2"},
    {"id": 3, "name": "División 3"},
    {"id": 4, "name": "División 4"},
    {"id": 5, "name": "División 5"},
  ];

  return DropdownButtonFormField<String>(
    decoration: InputDecoration(border: OutlineInputBorder()),
    value: selectedDivision,
    items: divisions.map((division) {
      return DropdownMenuItem(
        value: division["id"].toString(),
        child: Text(division["name"]),
      );
    }).toList(),
    onChanged: (value) {
      setState(() {
        selectedDivision = value!;
        _divisionController.text = selectedDivision; // ✅ Guardar el valor en el controlador
      });
    },
    validator: (value) => value == 0 ? "Debe elegir una división" : null,
  );
}

  Widget _buildSubmitButton(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            cubit.register(
              name: _nameController.text,
              lastName: _lastNameController.text,
              email: _emailController.text,
              phoneNumber: _phoneController.text,
              truckNumber: _truckNumberController.text,
              transportDivisionId: int.parse(_divisionController.text) ,
              password: _passwordController.text,
              repeatPassword: _repeatPasswordController.text,
            );
          }
        },
        child: Text('Solicitar acceso'),
      ),
    );
  }
}