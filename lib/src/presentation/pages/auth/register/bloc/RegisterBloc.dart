import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final formKey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formkey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(
          name: BlocFormItem(
              value: event.name.value,
              error: event.name.value.isEmpty ? 'Ingresa el nombre' : null),
          formkey: formKey));
    });

    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(
          lastname: BlocFormItem(
              value: event.lastname.value,
              error:
                  event.lastname.value.isEmpty ? 'Ingresa el apellido' : null),
          formkey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlocFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? 'Ingresa el email' : null),
          formkey: formKey));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(
          phone: BlocFormItem(
              value: event.phone.value,
              error: event.phone.value.isEmpty ? 'Ingresa el telefono' : null),
          formkey: formKey));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: BlocFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? 'Ingresa el password'
                  : event.password.value.length < 6
                      ? 'Mas de 6 caracteres'
                      : null),
          formkey: formKey));
    });

    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(
          confirmPassword: BlocFormItem(
              value: event.confirmPassword.value,
              error: event.confirmPassword.value.isEmpty
                  ? 'Confirma el Password'
                  : event.confirmPassword.value.length < 6
                      ? 'Mas de 6 caracteres'
                      : event.confirmPassword.value != state.password.value
                          ? 'Los password no coinciden'
                          : null),
          formkey: formKey));
    });

    on<FormSubmit>((event, emit) {
      print('Name: ${state.name.value}');
      print('LastName: ${state.lastname.value}');
      print('Email: ${state.email.value}');
      print('Phone: ${state.phone.value}');
      print('Password: ${state.password.value}');
      print('Confirm Password: ${state.confirmPassword.value}');
    });

    on<FormReset>((event, emit) {
      state.formkey?.currentState?.reset();
    });
  }
}
