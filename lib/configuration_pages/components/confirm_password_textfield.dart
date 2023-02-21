import 'package:flutter/material.dart';

import '../../constants.dart';

class ConfirmPasswordTextfield extends StatefulWidget {
  const ConfirmPasswordTextfield({
    super.key,
  });

  @override
  State<ConfirmPasswordTextfield> createState() =>
      _ConfirmPasswordTextfieldState();
}

class _ConfirmPasswordTextfieldState extends State<ConfirmPasswordTextfield> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: !_passwordVisible,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none),
          filled: true,
          icon: const Icon(
            Icons.lock,
            size: 35,
          ),
          hintText: "Confirmez votre Mot de passe",
          //labelText: 'Matricule',
          fillColor: const Color.fromARGB(255, 216, 214, 214),
          focusColor: k2c),
    );
  }
}
