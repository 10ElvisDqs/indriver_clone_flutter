import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final GlobalKey<FormState>? formkey;

  const RegisterState({
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.lastname = const BlocFormItem(error: 'Ingrese el apellido'),
    this.email = const BlocFormItem(error: 'Ingrese el email'),
    this.phone = const BlocFormItem(error: 'Ingrese el telefono'),
    this.password = const BlocFormItem(error: 'Ingrese el password'),
    this.confirmPassword =
        const BlocFormItem(error: 'Ingrese el confirmPassword'),
    this.formkey,
  });

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    GlobalKey<FormState>? formkey,
  }) {
    return RegisterState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formkey: formkey,
    );
  }

  @override
  List<Object?> get props => [
        name,
        lastname,
        email,
        phone,
        password,
        confirmPassword,
      ];
}
