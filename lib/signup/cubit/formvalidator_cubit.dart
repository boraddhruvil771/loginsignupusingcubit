import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'formvalidator_state.dart';

class FormvalidatorCubit extends Cubit<FormValidatorState> {
  FormvalidatorCubit() : super(FormValidatorUpdate());
  void initFoValidatorrm({
    String email = '',
    String name = '',
    String address = '',
    String city = '',
  }) {
    emit(state.copyWith(
      email: email,
      name: name,
      address: address,
      city: city,
    ));
  }

  void updateEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String? password) {
    emit(state.copyWith(password: password));
  }

  void updateConfirmPassword(String? confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void updateName(String? name) {
    emit(state.copyWith(name: name));
  }

  void updateAddress(String? address) {
    emit(state.copyWith(address: address));
  }

  void updateCity(String? city) {
    emit(state.copyWith(city: city));
  }

  void updateAutovalidateMode(AutovalidateMode? autovalidateMode) {
    emit(state.copyWith(autovalidateMode: autovalidateMode));
  }

  void toggleObscureText() {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void reset() {
    emit(const FormValidatorUpdate());
  }
}
