import 'package:florida_sand_gravel/features/auth/presentation/cubits/terms_coditions/terms_conditions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TermsConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsConditionsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Acceso a Florida Sand'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<TermsConditionsCubit, TermsConditionsState>(
          builder: (context, state) {
            if (state is TermsConditionsAccepted) {
              return _buildAcceptedScreen(context);
            } else if (state is TermsConditionsRejected) {
              return _buildRejectedScreen(context);
            }
            return _buildTermsScreen(context);
          },
        ),
      ),
    );
  }

Widget _buildTermsScreen(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Términos y condiciones',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView( // ✅ Permite desplazamiento vertical
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Fusce ut cursus a consectetur platea. '
                  'Posuere imperdiet consequat mi sit vitae volutpat.',
                ),
                SizedBox(height: 16),
                _buildTermItem(1, 'Lorem ipsum dolor sit amet'),
                _buildTermItem(2, 'Lorem ipsum dolor sit amet.'),
                _buildTermItem(3, 'Lorem ipsum dolor sit amet.'),
                _buildTermItem(4, 'Lorem ipsum dolor sit amet.'), 
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        _buildButtons(context),
      ],
    ),
  );
}

  Widget _buildAcceptedScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 80),
          SizedBox(height: 16),
          Text('Has aceptado los términos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            child: Text('Ir a la App'),
          ),
        ],
      ),
    );
  }

  Widget _buildRejectedScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 80),
          SizedBox(height: 16),
          Text('Has rechazado los términos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Regresar'),
          ),
        ],
      ),
    );
  }

  Widget _buildTermItem(int number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$number. $text', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Neque adipiscing aliquet massa nunc. Morbi semper et scelerisque libero nulla vulputate arcu. Vel condimentum morbi ornare tempor non. Quam turpis tincidunt elementum pellentesque. Purus duis nam vivamus arcu nisl tincidunt proin tincidunt lacus. Mauris congue eros quam nec varius eget nulla. '),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    final cubit = context.read<TermsConditionsCubit>();

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: cubit.acceptTerms,
            child: Text('Aceptar y continuar'),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: OutlinedButton(
            onPressed: cubit.rejectTerms,
            child: Text('Rechazar'),
          ),
        ),
      ],
    );
  }
}