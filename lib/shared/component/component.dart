import 'package:flutter/material.dart';

Widget defaultFormField ({
  required TextEditingController controller,
  required TextInputType keyboardType,
  VoidCallback? onSubmit(String value)?,
  VoidCallback? onChanged(String value)?,
  // required String? Function(String?)? validate,
  String? labelText,
  IconData? prefixIcon,
  required FormFieldValidator? validate,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? suffixPressed,
  String? hintText,
  String? initialValue,

  VoidCallback? onTap,


}) => TextFormField(
  controller: controller,
  keyboardType: keyboardType,
  onFieldSubmitted: onSubmit,
  onChanged: onChanged,
  validator: validate,
  decoration: InputDecoration(
    hintText: hintText,
    labelText: labelText,
    border: OutlineInputBorder(),
    prefixIcon: Icon(
      prefixIcon,
    ),
    suffixIcon: suffix != null ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffix,
      ),
    ) : null,
  ),
  obscureText: isPassword,
  onTap: onTap,
  initialValue: initialValue,
);
