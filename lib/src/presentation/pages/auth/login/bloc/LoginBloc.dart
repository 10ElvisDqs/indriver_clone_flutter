import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formkey = GlobalKey<FormState>();
  LoginBloc() : super(LoginState()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formkey));
    });

    on<EmailChanged>((event, emit) {
      // event.email lo que el usiario esta escribiendo
      emit(state.copyWith(
        email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingrese el Email' : null),
        formKey: formkey,
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: BlocFormItem(
            value: event.password.value,
            error: event.password.value.isEmpty
                ? 'Ingresa el Password'
                : event.password.value.length < 6
                    ? 'Minimo 6 caracteres'
                    : null),
        formKey: formkey,
      ));
    });

    on<FormSubmit>((event, emit) {
      print('Email: ${state.email.value}');
      print('Password: ${state.password.value}');
    });
  }
}
