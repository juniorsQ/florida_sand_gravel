import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'terms_conditions_state.dart';


class TermsConditionsCubit extends Cubit<TermsConditionsState> {
  TermsConditionsCubit() : super(TermsConditionsInitial());

  void acceptTerms() {
    emit(TermsConditionsAccepted());
  }

  void rejectTerms() {
    emit(TermsConditionsRejected());
  }
}