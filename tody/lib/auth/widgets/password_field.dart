// password_field.dart
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';

// import 'package:form_fields/form_fields.dart'; // your model

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onChanged,
    this.label = 'Password',
  });
  final void Function(String)? onChanged;
  final String label;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: AppColors.black, // ✅ this controls typed text color
        fontSize: 15,
      ),
      onChanged: widget.onChanged,
      obscureText: _obscure,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: 'Enter your password',
        hintStyle: const TextStyle(color: AppColors.grey),
        filled: true,
        fillColor: AppColors.shadeGrey,

        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
