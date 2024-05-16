import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextField.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 55, 0, 255),
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 255, 0, 0),
              ],
            ),
          ),
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //Horizontal
            mainAxisAlignment: MainAxisAlignment.center, //Vertical
            children: [
              _textLoginRotated(),
              SizedBox(
                height: 100,
              ),
              _textRegisterRotated(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(left: 60, bottom: 35),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 55, 0, 255),
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 255, 0, 0),
                ],
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35))),
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  _textWelcome('Welcome'),
                  _textWelcome('back...'),
                  _imageCar(),
                  _textLogin(),
                  DefaultTextField(
                    text: 'Email',
                    icon: Icons.email_outlined,
                  ),
                  DefaultTextField(
                    text: 'Password',
                    icon: Icons.lock_outline,
                    margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                  ),
                  //Spacer(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  DefaultButton(
                    text: 'Iniciar Sesion',
                  ),
                  _separatorOr(),
                  SizedBox(height: 10),
                  _textDontHaveAccount(context),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textLoginRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 27),
      ),
    );
  }

  Widget _textRegisterRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'register');
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
    );
  }

  Widget _textWelcome(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _imageCar() {
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset(
        'assets/img/car.png',
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _textLogin() {
    return Text(
      'Login',
      style: TextStyle(
          fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tiene cuenta?',
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey[100],
          ),
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
          child: Text('registrate',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
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
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5),
        )
      ],
    );
  }
}
