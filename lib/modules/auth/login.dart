import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Image.asset('assets/septiembre.png', width: 200, height:200),
          const SizedBox(height:16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Correo electronico',
              label: Text('Correo electronico'),
              labelStyle: TextStyle(color: Colors.black),
            ),
            keyboardType: TextInputType.emailAddress,
            
            controller: _email,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Contraseña',
              label: Text('Contraseña'),
              labelStyle: TextStyle(color: Colors.black),
              suffixIcon: IconButton(onPressed: () {setState((){
                _isObscure = !_isObscure;
              });
              }, icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off)),
            ),            
            controller: _password,
            obscureText: _isObscure,
          ),
          const SizedBox( height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(onPressed: (){
              print('Email: ${_email.text}');
              print('Email: ${_password.text}');
            }, 
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )
            ),
            child: const Text('Iniciar sesion')),
          )
        ]
      ),
    );
  }
}
