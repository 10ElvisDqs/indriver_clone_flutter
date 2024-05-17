import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
//import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  RegisterState state;
  RegisterContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formkey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color.fromARGB(255, 55, 0, 255),
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 255, 0, 0),
                ]) // LinearGradient
                ), // BoxDecoration
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //Horizontal
              mainAxisAlignment: MainAxisAlignment.center, //Vertical
              children: [
                _textLoginRotated(context),
                SizedBox(height: 100),
                _textRegisterRotated(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 78, 5, 5),
                      Color.fromARGB(255, 192, 7, 7),
                      Color.fromARGB(255, 78, 5, 5),
                      Color.fromARGB(255, 0, 0, 0),
                    ])),
            child: Stack(
              children: [
                _imageBackgroud(context),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _imageBanner(),
                      DefaultTextFieldOutlined(
                        text: 'Nombre',
                        icon: Icons.person_outline,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 25),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              NameChanged(name: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.name.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Apellido',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(LastNameChanged(
                              lastname: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.lastname.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              EmailChanged(email: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Telefono',
                        icon: Icons.phone_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              PhoneChanged(phone: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.phone.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Password',
                        icon: Icons.lock_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(PasswordChanged(
                              password: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.password.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Confirmar Password',
                        icon: Icons.lock_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              ConfirmPasswordChanged(
                                  confirmPassword: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.confirmPassword.error;
                        },
                      ),
                      DefaultButton(
                        onPressed: () {
                          if (state.formkey!.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FormSubmit());
                            context.read<RegisterBloc>().add(FormReset());
                          }
                        },
                        text: 'Crear Usuario',
                        margin: EdgeInsets.only(top: 60, left: 60, right: 60),
                      ),
                      SizedBox(height: 10),
                      _separatorOr(),
                      SizedBox(
                        height: 5,
                      ),
                      _textIAlreadyHaveAccount(context)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // Stack,
  }

  Widget _imageBackgroud(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 50),
      child: Image.asset(
        'assets/img/destination.png',
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.4,
        opacity: AlwaysStoppedAnimation(0.3),
      ),
    );
  }

  Widget _textIAlreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ya tienes cuenta?',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'login');
          },
          child: Text(
            'Iniciar session',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          'O',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/car.png',
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _textRegisterRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Register',
        style: TextStyle(
            fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'login');
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Login',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
